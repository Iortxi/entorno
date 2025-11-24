# Dotfiles

*Based on [Antonio Sarosi dotfiles](https://github.com/antoniosarosi/dotfiles)*

**Language**
- [Español](./README.es.md)
- English

# Overview
Full-automatized desktop enviroment configuration with multiple windows managers.

Tested on (it should work on any debian/ubuntu distro with apt):
- Kali Linux

# Installation
```bash
# Clone the repo
git clone https://github.com/Iortxi/dotfiles.git

# Move to dir
cd dotfiles

# It's configured to use the spanish keyboard with setxkbmap, change if you need (default US keyboard)
nano .config/qtile/autostart.sh
nano .config/spectrwm/autostart.sh

# DO NOT execute with sudo, it needs your user. It'll throw error if you do anyways :D
# The -l flag is for labtops, it'll also configure battery and brightness in case you need it
./entorno.sh [-l]
```

---
## Apps
All windows managers have the same apps keybindings.

| Key               | Action                        |
|-------------------|-------------------------------|
| mod + m           | Rofi                          |
| mod + shift + m   | Rofi with open windows        |
| mod + return      | Terminal (Kitty)              |
| mod + space       | Google Chrome                 |
| mod + e           | File explorer (Thunar)        |
| mod + o           | Obsidian                      |
| mod + b           | Burpsuite                     |
| mod + v           | Volume control (Pavucontrol)  |
| mod + k           | Calculator (Kcalc)            |
| mod + s           | Screenshots (Flameshot)       |

---

# Windows managers
There's the windows managers configured in this dotfiles:
- Qtile (recommended)
- Spectrwm



# Qtile
Python-made window manager (prettier than Spectrwm :D).

*foto*


## Keybindings
| Key               | Action                    |
|-------------------|---------------------------|
| mod + Up          | Focus up windows          |
| mod + Down        | Focus down windows        |
| mod + Right       | Focus right windows       |
| mod + Left        | Focus left windows        |
| mod + q           | Kill window               |
| mod + alt + Up    | Grow window               |
| mod + alt + Down  | Shrink window             |
| mod + a           | Monadtall layout          |
| mod + f           | Max layout                |
| mod + c           | Monadwide layout          |
| mod + Tab         | Next window (max layout)  |
| mod + comma       | Switch focus of monitor   |
| mod + Ctrl + r    | Restart Qtile             |
| mod + Ctrl + q    | Quit Qtile (to login)     |


## Scripts
There's some python scripts made **specifically** for Qtile with alias in [.bashrc](./shell/.bashrc).
### Theme
Switch de colors of the bar

### Interface
Switch the network interface to check in the bar

---

# Spectrwm
C-made window manager (the **not** recommended one D:). Less stable than Qtile, it gives more problems

## Scripts
There's also some bash scripts made **specifically** for Spectrwm with alias in [.bashrc](./shell/.bashrc). They use files in `~/.config/spectrwm/` to store some info (the info printed at the bar).
### Attack
Sets your attacker IP at the bar

### Target
Sets the IP of your victim at the bar

---

## Monitors
arandr

## Volume
pavucontrol
