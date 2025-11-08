#!/usr/bin/env bash

if [ -n "$bt_sink" ]; then
    pactl set-sink-volume "$bt_sink" +5%
else
    # Se não encontrou, usa o sink padrão (como fallback)
    default_sink=$(pactl info | grep "Default Sink" | awk '{print $3}')
    pactl set-sink-volume "$default_sink" +5%
fi
