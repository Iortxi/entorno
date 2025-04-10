#!/bin/bash

# Spectrwm autostart script

# Target e IP vacios
echo -n "No IP" > ~/.config/spectrwm/ipBD
echo -n "No target" > ~/.config/spectrwm/objetivoBD

# Fondo de pantalla
feh --bg-scale ~/wallpapers/nvidia_loko.jpg

# Teclado en espagnol
setxkbmap 'es,es' -model latin1

# Subir volumen al maximo
pactl set-sink-volume @DEFAULT_SINK@ 100%

# Pantallas multiples
num_monitores=`xrandr | grep connected | wc -l`
if [ $num_monitores -gt 1 ]; then
    xrandr --output HDMI-1 --primary --mode 1920x1080 --pos 1920x0 --rotate inverted --output DVI-D-1 --mode 1920x1080 --pos 0x0 --rotate inverted
    xrandr --output HDMI-1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output DVI-D-1 --mode 1920x1080 --pos 0x0 --rotate normal
fi

# Compositor de imagenes
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

