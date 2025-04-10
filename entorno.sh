#!/bin/bash

############################################
# UBUNTU/DEBIAN
############################################


# Verificacion de usuario no root
if [ $UID -eq 0 ]; then
  echo "[!] No debes ejecutar esto como root"
  exit 1
fi

# Actualizacion de repositorios de paquetes
sudo apt update

# Instalacion de paquetes
sudo apt install -y spectrwm pamixer bat lsd console-data \
feh rofi brightnessctl cbatticon volumeicon-alsa \
flameshot picom htop micro thunar pavucontrol arandr \
kcalc vlc apt-show-versions pulseaudio-utils

# Teclado en espagnol
sudo setxkbmap -layout 'es,es' -model latin1

# Dependencias de python -> README
pip install termcolor --break-system-packages

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
pip install powerline-shell --break-system-packages
sudo pip install powerline-shell --break-system-packages
cp shell/.bashrc ~
sudo cp /root/.bashrc /root/.bashrc_backup
sudo rm -f /root/.bashrc
sudo ln -s /home/"$USER"/.bashrc /root
cp shell/config.json ~/.config/powerline-shell
sudo ln -s /home/"$USER"/.local/bin/powerline-shell /usr/bin/powerline-shell

# Spectrwm
sudo cp configs/spectrwm.conf /etc/
sudo cp configs/spectrwm.desktop /usr/share/xsessions

# Qtile
sed -i 's/iortxi/$USER/g' .config/qtile/scripts/qtile.sh
pip install qtile --break-system-packages
sudo pip install qtile --break-system-packages
sed -i 's/qtile start/\/home\/$USER\/.config\/qtile\/scripts\/qtile.sh/g' configs/qtile.desktop
sudo cp configs/qtile.desktop /usr/share/xsessions
sudo ln -s /home/$USER/.local/bin/qtile /usr/bin/qtile

# Fuentes - UbuntuMono Nerd Font ; Hack Nerd Font
mkdir -p ~/.local/share/fonts
cp fuente/* ~/.local/share/fonts

# Kitty Terminal
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
sudo ln -s /home/$USER/.local/kitty.app/bin/kitty /usr/bin/kitty
sudo ln -s /home/$USER/.local/kitty.app/bin/kitten /usr/bin/kitten

# Wallpapers
cp -r wallpapers ~

# Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm -f google-chrome-stable_current_amd64.deb

# Visual Studio Code
wget 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64'
mv 'download?build=stable&os=linux-deb-x64' 'vscode.deb'
sudo dpkg -i vscode.deb
rm -f vscode.deb

# Directorio .config
cp -r .config/* ~/.config

# Sudo sin password
echo "$USER ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers

# Grub sin timeout
sudo sed -i 's/GRUB_TIMEOUT.*/GRUB_TIMEOUT=-1/g' /etc/default/grub
sudo update-grub
