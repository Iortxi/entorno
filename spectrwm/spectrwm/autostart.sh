#!/bin/bash

# Spectrwm autostart script

echo -n "No IP" > ~/.config/spectrwm/ipBD
echo -n "No target" > ~/.config/spectrwm/objetivoBD
feh --bg-scale ~/Wallpapers/Vasco.jpg &
setxkbmap 'es,es' -model latin1

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

