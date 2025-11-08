#!/bin/bash

# Porcentagem mínima antes de avisar
LIMITE=100
# Variável para evitar spam de notificação
AVISADO=0

while true; do
    # Pega a porcentagem da bateria e o status (Charging/Discharging)
    PORCENTAGEM=$(cat /sys/class/power_supply/BAT*/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT*/status)

    if [[ "$PORCENTAGEM" -ge "$LIMITE" ]]; then
        if [[ $AVISADO -eq 0 ]]; then
            notify-send -u normal "  BATERIA CARREGADA ${PORCENTAGEM}%"
            AVISADO=1
        fi
    else
        AVISADO=0
    fi

    sleep 60
done

