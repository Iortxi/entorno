#!/bin/bash

if [ $UID -ne 0 ]; then
  echo "[!] Tienes que ser root"
  exit 1
fi

apt install -y spectrwm

cp -r Hack /usr/share/fonts/

mkdir -p /home/$USER/.config/spectrwm
cp spectrwm/* /home/$USER/.config/spectrwm
cp spectrwm.conf /etc/

