#!/bin/bash

# Ajuste este caminho para o nome da sua bateria, normalmente algo como BAT0 ou BAT1
battery_path="/sys/class/power_supply/BAT0"

if [ ! -d "$battery_path" ]; then
  echo "Bateria não encontrada em $battery_path"
  exit 1
fi

capacity=$(cat "$battery_path/capacity")
status=$(cat "$battery_path/status")

echo " 󰁹 $capacity%"

