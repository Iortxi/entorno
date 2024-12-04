#!/bin/bash

# Spectrwm autostart script

echo -n "No IP" > ~/.config/spectrwm/ipBD
echo -n "No target" > ~/.config/spectrwm/objetivoBD
feh --bg-scale ~/wallpapers/nvidia_loko.jpg
setxkbmap 'es,es' -model latin1
picom &

trayer                 \
    --monitor primary  \
    --edge top         \
    --widthtype pixel  \
    --width 100        \
    --heighttype pixel \
    --height 18        \
    --align right      \
    --margin 455       \
    --transparent true \
    --alpha 0          \
    --tint 0x0F101A    \
    --iconspacing 3    \
    --distance 1 &

