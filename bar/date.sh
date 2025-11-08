#!/usr/bin/env bash

if [ "$1" ]; then
    notify-send "clicado no date"
    exit 0
fi

DateDwmBlocks=$(date '+%b/%d')
echo "󱪹 $DateDwmBlocks "

