# Antonio Sarosi
# https://youtube.com/c/antoniosarosi
# https://github.com/antoniosarosi/dotfiles

# Qtile keybindings

from libqtile.config import Key
from libqtile.lazy import lazy


mod = "mod4"

keys = [Key(key[0], key[1], *key[2:]) for key in [
    # ------------ Window Configs ------------

    # Switch between windows in current stack pane
    ([mod], "Down", lazy.layout.down()),
    ([mod], "Up", lazy.layout.up()),
    ([mod], "Left", lazy.layout.left()),
    ([mod], "Right", lazy.layout.right()),

    # Change window sizes (MonadTall)
    ([mod, "mod1"], "Up", lazy.layout.grow()),
    ([mod, "mod1"], "Down", lazy.layout.shrink()),

    # Toggle floating
    # Buena idea, no cambiar
    ([mod, "shift"], "f", lazy.window.toggle_floating()),

    # Move windows up or down in current stack
    ([mod, "shift"], "Down", lazy.layout.shuffle_down()),
    ([mod, "shift"], "Up", lazy.layout.shuffle_up()),

    # Toggle between different layouts as defined below
    ([mod], "Tab", lazy.next_layout()),
    ([mod, "shift"], "Tab", lazy.prev_layout()),

    # Kill window
    ([mod], "q", lazy.window.kill()),

    # Switch focus of monitors
    ([mod], "comma", lazy.next_screen()),
    ([mod], "comma", lazy.prev_screen()),

    # Restart Qtile
    ([mod, "control"], "r", lazy.restart()),

    ([mod, "control"], "q", lazy.shutdown()),
    ([mod], "r", lazy.spawncmd()),

    # ------------ App Configs ------------

    # Menu
    ([mod], "m", lazy.spawn("rofi -show drun")),

    # Window Nav (rofi)
    ([mod, "shift"], "m", lazy.spawn("rofi -show")),

    # Terminal
    ([mod], "Return", lazy.spawn("kitty")),

    # Browser
    ([mod], "Space", lazy.spawn("google-chrome-stable")),

    # File Explorer
    ([mod], "e", lazy.spawn("dolphin")),

    # Obsidian
    ([mod], "o", lazy.spawn("obsidian")),

    # Burpsuite
    ([mod], "b", lazy.spawn("burpsuite")),

    # Volume control
    ([mod], "v", lazy.spawn("pavucontrol")),

    # Calculator
    ([mod], "k", lazy.spawn("kcalc")),

    # Flameshot
    ([mod], "s", lazy.spawn("flameshot gui")),

    # Flameshot kill
    # Opcion de agnadir a ~/.config/qtile/scripts o algo asi
    ([mod, "shift"], "s", lazy.spawn("~/.config/spectrwm/kill_flameshot.sh")),

    # ------------ Hardware Configs ------------

    # Volume
    ([], "XF86AudioLowerVolume", lazy.spawn(
        "pactl set-sink-volume @DEFAULT_SINK@ -5%"
    )),
    ([], "XF86AudioRaiseVolume", lazy.spawn(
        "pactl set-sink-volume @DEFAULT_SINK@ +5%"
    )),
    ([], "XF86AudioMute", lazy.spawn(
        "pactl set-sink-mute @DEFAULT_SINK@ toggle"
    )),

    # Brightness
    # MIRAR SI EL '-' EN EL DE BAJAR EL VOLUMEN VA DESPUES DEL '%' O ANTES
    #([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +5%")),
    #([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 5%-")),
]]
