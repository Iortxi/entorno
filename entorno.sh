#!/bin/bash

if [ $UID -ne 0 ]; then
  echo "[!] Tienes que ser root"
  exit 1
fi

apt install -y spectrwm

mkdir -p /home/iortxi/.fonts/
cp -r fuente/* /home/iortxi/.fonts/

mkdir -p /home/iortxi/.config/spectrwm
cp spectrwm/* /home/iortxi/.config/spectrwm

cp spectrwm.conf /etc/

