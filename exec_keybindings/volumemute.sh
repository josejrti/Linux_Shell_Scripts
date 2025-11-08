#!/usr/bin/env bash
exec /home/josjr/scripts/notifications/volmuted.sh &

if [ -n "$bt_sink" ]; then
    pactl set-sink-volume "$bt_sink" 0
else
    # Se não encontrou, usa o sink padrão (como fallback)
    default_sink=$(pactl info | grep "Default Sink" | awk '{print $3}')
    pactl set-sink-volume "$default_sink" 0
fi
