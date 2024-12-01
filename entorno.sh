#!/bin/bash

############################################
# UBUNTU/DEBIAN
############################################


# Verificacion de usuario no root
if [ $UID -eq 0 ]; then
  echo "[!] No debes ejecutar esto como root"
  exit 1
fi

# Actualizacion de repos de paquetes
sudo apt update

# Instalacion de paquetes necesarios
sudo apt install -y spectrwm pamixer bat lsd console-data \
xserver-xorg xinit libpangocairo-1.0-0 python3-pip python3-xcffib python3-cairocffi \
feh rofi brightnessctl cbatticon volumeicon-alsa flameshot picom neofetch

# Teclado en espagnol
sudo setxkbmap -layout 'es,es' -model latin1

# Neovim 0.10
wget https://github.com/neovim/neovim/releases/download/v0.10.0/nvim.appimage -O nvim
chmod +x nvim
sudo mv nvim /usr/bin

# Obsidian
wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.7.7/Obsidian-1.7.7.AppImage -O obsidian
chmod +x obsidian
sudo mv obsidian /usr/bin

# Shell (bash) y prompt
sudo chsh -s /usr/bin/bash "$USER"
sudo chsh -s /bin/bash root
pip install powerline-shell
sudo pip install powerline-shell
cp shell/.bashrc ~
sudo cp /root/.bashrc /root/.bashrc_backup
sudo rm -f /root/.bashrc
sudo ln -s /home/"$USER"/.bashrc /root
cp shell/config.json ~/.config/powerline-shell
sudo ln -s /home/"$USER"/.local/bin/powerline-shell /usr/bin/powerline-shell

# Spectrwm
mkdir -p ~/.config/spectrwm
chmod +x spectrwm/spectrwm/attack.sh spectrwm/spectrwm/target.sh spectrwm/spectrwm/autostart.sh \
spectrwm/spectrwm/baraction.sh
cp -r spectrwm/spectrwm/* ~/.config/spectrwm
sudo cp spectrwm/spectrwm.conf /etc/

# Qtile
pip install qtile
sudo pip install qtile
mkdir -p ~/.config/qtile
chmod +x qtile/qtile/autostart.sh
cp -r qtile/qtile/* ~/.config/qtile
sudo cp qtile/qtile.desktop /usr/share/xsessions
sudo ln -s /home/"$USER"/.local/bin/qtile /usr/bin/qtile

# Fuentes - UbuntuMono Nerd Font ; Hack Nerd Font
mkdir -p ~/.local/share/fonts
cp fuente/* ~/.local/share/fonts

# Kitty Terminal
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
sudo ln -s /home/"$USER"/.local/kitty.app/bin/kitty /usr/bin/kitty
sudo ln -s /home/"$USER"/.local/kitty.app/bin/kitten /usr/bin/kitten
cp -r kitty ~/.config

# Wallpapers
mkdir ~/Wallpapers

# Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm -f google-chrome-stable_current_amd64.deb
