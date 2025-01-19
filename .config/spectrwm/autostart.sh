#!/bin/bash

# Spectrwm autostart script

echo -n "No IP" > ~/.config/spectrwm/ipBD
echo -n "No target" > ~/.config/spectrwm/objetivoBD
feh --bg-scale ~/wallpapers/nvidia_loko.jpg
setxkbmap 'es,es' -model latin1
xrandr --output HDMI-1 --primary --mode 1920x1080 --pos 1920x0 --rotate inverted --output DVI-D-1 --mode 1920x1080 --pos 0x0 --rotate inverted
xrandr --output HDMI-1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output DVI-D-1 --mode 1920x1080 --pos 0x0 --rotate normal
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

