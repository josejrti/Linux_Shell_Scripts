#!/bin/bash

LAST_SSID=""

while true; do
    SSID=$(iwgetid -r)  # Pega o SSID atual (nome da rede Wi-Fi)

    if [[ -n "$SSID" ]]; then
        STATUS="CONECTADO | $SSID"
    else
        STATUS="NENHUMA REDE"
    fi

    if [[ "$STATUS" != "$LAST_SSID" ]]; then
        notify-send "  $STATUS"
        LAST_SSID="$STATUS"
    fi

    sleep 5
done

