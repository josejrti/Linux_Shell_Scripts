#!/bin/bash

# Lê o tempo de CPU da primeira medição
read cpu user nice system idle iowait irq softirq steal guest < /proc/stat
total1=$((user + nice + system + idle + iowait + irq + softirq + steal))
idle1=$((idle + iowait))

# Espera 1 segundo
sleep 1

# Lê novamente
read cpu user2 nice2 system2 idle2 iowait2 irq2 softirq2 steal2 guest2 < /proc/stat
total2=$((user2 + nice2 + system2 + idle2 + iowait2 + irq2 + softirq2 + steal2))
idle2=$((idle2 + iowait2))

# Calcula uso real da CPU
total_diff=$((total2 - total1))
idle_diff=$((idle2 - idle1))
usage=$(( (100 * (total_diff - idle_diff)) / total_diff ))

# Exibe com ícone Nerd Font
printf " %d%%\n" "$usage"


