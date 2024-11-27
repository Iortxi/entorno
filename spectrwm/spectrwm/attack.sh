#!/bin/bash

# Uso del script
function uso() {
  echo -e "\n[!] Uso : attack [-r | -i interfaz | texto]\n"
  exit 1
}

# Texto manual o reset
function texto() {
  echo -n "$1" > /home/iortxi/.config/spectrwm/ipBD
}

# IP de interfaz de red
function interfaz() {
  int="$1"
  interfaces=$(ifconfig | grep ".*: flags" | awk '{print $1}' | tr -d ':'| xargs)
  num_interfaces=$(echo -n "$interfaces" | wc -w)
  secuencia=$(seq 1 $num_interfaces)
  esta=0
  for n in $secuencia; do
    inter=$(echo -n $interfaces | cut -d ' ' -f $n)
    if [ "$int" = "$inter" ]; then
      esta=1
    fi
  done

  if [ $esta -eq 0 ]; then
    echo -e "\n[!] Error: La interfaz de red debe existir\n"
    exit 1
  fi
  
  ip=$(ifconfig | grep -A 1 "$int" | grep "inet" | awk '{print $2}')
  echo -n "$ip" > /home/iortxi/.config/spectrwm/ipBD
}

# Verificación número de argumentos
if [[ $# -gt 2 || $# -lt 1 ]]; then
  uso
fi

# Verificación de argumentos
if [ $# -eq 1 ]; then
  if [ "$1" = "-r" ]; then
    texto "No IP"
  elif [[ "$1" =~ -+ ]]; then
    uso
  else
    texto "$1"
  fi
else
  if [[ "$1" = "-i" && ! "$2" =~ -+ ]]; then
    interfaz $2
  else
    uso
  fi
fi

