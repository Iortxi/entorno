# Dotfiles

# NOT FINISHED

*Based on [Antonio Sarosi dotfiles](https://github.com/antoniosarosi/dotfiles)*

**Language**
- [Español 🇪🇸](./README.es.md)
- English 🇬🇧

# Overview
Full-automatized desktop enviroment configuration with multiple windows managers.

**Prefered to execute this in a fresh-new SO installation**. It should work on any debian/ubuntu distro with apt.

Tested on:
- Kali Linux


# Index
- [Installation](#installation)
- [Apps](#apps)
- [Windows managers](#windows-managers)
    - [Qtile](#qtile)
    - [Spectrwm](#spectrwm)
- [Terminal](#terminal)
- [Monitors](#monitors)


# Installation
```bash
# Clone the repo
git clone https://github.com/Iortxi/dotfiles.git

# Move to dir
cd dotfiles

# It uses the spanish keyboard with setxkbmap, change if you need (US default if you remove it)
nano .config/qtile/autostart.sh
nano .config/spectrwm/autostart.sh

# DO NOT execute with sudo, it needs your user. It'll throw error if you do anyways :D
# The -l flag is for labtops, in case you need to configure battery and brightnesss
./entorno.sh [-l]
```

## Apps
All windows managers have the same apps keybindings.

| Key               | Action                        |
|-------------------|-------------------------------|
| Mod + m           | Rofi                          |
| Mod + Shift + m   | Rofi with active windows      |
| Mod + Return      | Terminal (Kitty)              |
| Mod + Space       | Google Chrome                 |
| Mod + e           | File explorer (Thunar)        |
| Mod + o           | Obsidian                      |
| Mod + b           | Burpsuite                     |
| Mod + v           | Volume control (Pavucontrol)  |
| Mod + k           | Calculator (Kcalc)            |
| Mod + s           | Screenshots (Flameshot)       |


# Windows managers
There's the windows managers configured in this dotfiles:
- [Qtile (recommended)](#qtile)
- [Spectrwm](#spectrwm)



# Qtile
Python-made window manager (prettier than Spectrwm :D). There's 3 layouts configured. To add more, check the [Qtile layouts docu](https://docs.qtile.org/en/latest/manual/ref/layouts.html).

*una foto de la barra con el fondo de pantalla y 3 mas (una con cada layout)*


## Keybindings
| Key               | Action                    |
|-------------------|---------------------------|
| Mod + Up          | Focus up windows          |
| Mod + Down        | Focus down windows        |
| Mod + Right       | Focus right windows       |
| Mod + Left        | Focus left windows        |
| Mod + q           | Kill window               |
| Mod + alt + Up    | Grow window               |
| Mod + alt + Down  | Shrink window             |
| Mod + a           | Monadtall layout          |
| Mod + f           | Max layout                |
| Mod + c           | Monadwide layout          |
| Mod + Tab         | Next window (max layout)  |
| Mod + Comma       | Switch focus of monitor   |
| Mod + Ctrl + r    | Restart Qtile             |
| Mod + Ctrl + q    | Quit Qtile (to login)     |


## Scripts
There's some python scripts made **specifically** for Qtile with alias in [.bashrc](./shell/.bashrc).
### Theme
Switch de colors of the bar

### Interface
Switch the network interface to check in the bar


# Spectrwm
C-made window manager (the **not** recommended one D:). Less stable than Qtile, it gives more problems

*foto*

## Scripts
There's also some bash scripts made **specifically** for Spectrwm with alias in [.bashrc](./shell/.bashrc). They use files in `~/.config/spectrwm/` to store some info (the info printed at the bar).
### Attack
Sets your attacker IP at the bar

### Target
Sets the IP of your victim at the bar


# Terminal
This desktop enviroment uses kitty as terminal in all of the windows managers. Not as fast as Alacritty but so useful to manage multiple shells in just one window.

**PERFECT** for avoid Tmux.

Sometimes when you paste text in it, a message with 2 paste options appears (`Sanitize and paste` and `Paste anyway`). Just choose the `Paste anyway` option pressing `p` to paste it the best way (experience).

## Keybindings
| Key                       | Action                                            |
|---------------------------|---------------------------------------------------|
| Mod + Return              | Launch kitty                                      |
| Ctrl + Shift + Return     | Launch shell in the same window (Divided screen)  |
| Ctrl + Alt + Up           | Focus to up terminal                              |
| Ctrl + Alt + Down         | Focus to down terminal                            |
| Ctrl + Alt + Right        | Focus to Right terminal                           |
| Ctrl + Alt + Left         | Focus to Left                                     |
| Ctrl + Shift + t          | Launch shell in a new tab                         |
| Ctrl + Shift + Tab        | Switch between tabs                               |
| Ctrl + Shift + q          | Kill current tab                                  |
| Ctrl + Shift + Alt + t    | Rename the current tab                            |
| Ctrl + Shift + '+'        | Zoom in                                           |
| Ctrl + Shift + '-'        | Zoom out                                          |
| Ctrl + Supr               | Delete the next word (Ctrl + Delete is bugged)    |
| Ctrl + Right              | Go to next word                                   |
| Ctrl + Left               | Go to last word                                   |
| F1                        | Copy to buffer 1                                  |
| F2                        | Paste from buffer 1                               |
| F3                        | Copy to buffer 2                                  |
| F4                        | Paste from buffer 2                               |


## Config files
`~/.config/kitty/color.ini` to config the colors.
`~/.config/kitty/kitty` to config the keybindings, font, shell.


# Monitors
This uses arandr to manage multiple monitors. It's so simple and easy. To automatize the process:
1. Launch arand (Rofi or terminal)
2. Place the screens in the position you want
3. Design -> Save as (this will generate a bash one-liner)
4. Put this one-liner in the autostart.sh files to automatically execute it when you login
