#!/bin/bash

SINK_ID=$(wpctl status sinks | grep "\*" | head -n1 | sed -E 's/.*\*\s+([0-9]+)\..*/\1/')

VOLUME_INFO=$(wpctl get-volume "$SINK_ID" 2>/dev/null)

if [ $? -ne 0 ] || [ -z "$VOLUME_INFO" ]; then
    echo ""
    exit 1
fi

VOLUME=$(echo "$VOLUME_INFO" | awk '{printf "%.0f", $2 * 100}')
IS_MUTED=$(echo "$VOLUME_INFO" | grep -q MUTED && echo "yes" || echo "no")

if [ "$IS_MUTED" = "yes" ]; then
    ICON=""
elif [ "$VOLUME" -eq 0 ]; then
    ICON=""
elif [ "$VOLUME" -lt 10 ]; then
    ICON=""
else
    ICON=""
fi

echo "$ICON $VOLUME%"

