#!/bin/bash

# Porcentagem mínima antes de avisar
LIMITE=15
# Variável para evitar spam de notificação
AVISADO=0

while true; do
    # Pega a porcentagem da bateria e o status (Charging/Discharging)
    PORCENTAGEM=$(cat /sys/class/power_supply/BAT*/capacity)

    if [[ "$PORCENTAGEM" -le "$LIMITE" ]]; then
        if [[ $AVISADO -eq 0 ]]; then
            notify-send -u critical "  BATERIA FRACA ${PORCENTAGEM}%"
            AVISADO=1
        fi
    else
        AVISADO=0
    fi

    sleep 60
done

