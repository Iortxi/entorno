#!/bin/bash

# Texto manual o reset
function texto() {
  echo -n "$1" > /home/iortxi/.config/spectrwm/objetivoBD
}

# Error de ejecución
function uso() {
  echo -e "\n[!] Uso: target [-r | texto]\n"
  exit 1
}

# Verificación número de argumentos
if [ $# -ne 1 ]; then
  uso
fi

# Casos de ejecución
if [ "$1" = "-r" ]; then
  texto "No target"
elif [[ "$1" =~ -+ ]]; then
  uso
else
  texto "$1"
fi

