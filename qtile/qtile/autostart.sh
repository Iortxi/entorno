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
feh --bg-scale ~/Wallpapers/nvidia_loko.jpg
