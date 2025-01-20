#!/bin/bash

icon() {
  echo -n "+@fg=1;$1+@fg=0;"
}

percentage() {
  current=`echo $1 | sed 's/%//'`
  if [ $current -le 25 ]; then 
    echo -n "$(icon $2)"
  elif [ $current -le 50 ]; then
    echo -n "$(icon $3)"
  elif [ $current -le 75 ]; then
    echo -n "$(icon $4)"
  else
    echo -n "$(icon $5)"
  fi
}

sleep_sec=2
i=0
while :; do

  # IP atacante
  echo -n "$(icon 󰛳 ) " 
  IP=`/usr/bin/cat ~/.config/spectrwm/ipBD | tr -d '\n'`
  echo -n "$IP "

  # Target
  echo -n "$(icon 󰓾 ) "
  target=`/usr/bin/cat ~/.config/spectrwm/objetivoBD | tr -d '\n'`
  echo -n "$target "

  # CPU
  cpu_usage=`top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}'`
  echo -n "$(icon  ) $cpu_usage% "
  
  # RAM
  ram_usage=`free -h | grep "Mem" | awk '{print $3}' | awk '{print substr($0, 1, length($0)-1)}'`
  echo -n "$(icon  ) $ram_usage "

  # Paquetes actualizables
  if (( $i % 60 == 0 )); then
    updates=$(apt list --upgradable | wc -l)
  fi
  echo -n "$(icon  ) $updates "

  # Brightness
  # (( br = $(brightnessctl get) * 100 / 255 ))
  # echo -n "$(percentage $br        ) $br% "

  # Volume
  vol=`pamixer --get-volume`
  if [[ `pamixer --get-mute` == "true" ]]; then
    echo -n "$(icon 󰝟 ) $vol% "
  else
    echo -n "$(percentage $vol     󰕾    ) $vol% "
  fi

  # Battery
  # if (( $i % 60 == 0 )); then
  #   bat=`upower -i /org/freedesktop/UPower/devices/battery_BAT1 |
  #   grep percentage |
  #   sed 's/ *percentage: *//g'`
  #   state=`upower -i /org/freedesktop/UPower/devices/battery_BAT1 |
  #   grep state |
  #   sed 's/ *state: *//'`
  # fi
  # if [ $state == "charging" -o $state == "fully-charged" ]; then
  #   echo -n "$(icon  ) "
  # else
  #   echo -n "$(percentage $bat            )  "
  # fi
  # echo -n "$bat "

  # Date
  if (( $i % 60 == 0 )); then
    dte="$(date +"$(icon 󰃵 ) %d/%m/%Y $(icon  ) %H:%M")"
  fi
  echo -e "$dte"

  # Time delay between refresh
  sleep $sleep_sec
  (( i += $sleep_sec ))
done
