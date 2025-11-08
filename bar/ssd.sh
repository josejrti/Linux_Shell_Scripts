#!/bin/bash

# Captura dados usados e totais em MB (mais fácil de somar)
get_usage_mb() {
    df -m "$1" 2>/dev/null | awk 'NR==2 {print $3, $2}'
}

read USED1 TOTAL1 <<< $(get_usage_mb /)
read USED2 TOTAL2 <<< $(get_usage_mb /home)

# Soma os valores
USED=$((USED1 + USED2))
TOTAL=$((TOTAL1 + TOTAL2))

# Converte para GB (inteiros ou com uma casa decimal)
USED_GB=$(awk "BEGIN {printf \"%.1f\", $USED/1024}")
TOTAL_GB=$(awk "BEGIN {printf \"%.1f\", $TOTAL/1024}")

# Exibe resultado
printf " %s/%s\n" "${USED_GB}G" "${TOTAL_GB}G"

