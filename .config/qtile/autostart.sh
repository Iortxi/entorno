#!/bin/sh

# Icono de bateria del systray
#cbatticon -u 5 &

# Volumen del systray
volumeicon &

# Teclado en espagnol
setxkbmap -layout es,es -model latin1

# Compositor de imagenes
picom &

# Fondo de pantalla
feh --bg-scale ~/wallpapers/nvidia_loko.jpg

# Pantallas multiples
xrandr --output HDMI-1 --primary --mode 1920x1080 --pos 1920x0 --rotate inverted --output DVI-D-1 --mode 1920x1080 --pos 0x0 --rotate inverted
xrandr --output HDMI-1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output DVI-D-1 --mode 1920x1080 --pos 0x0 --rotate normal
