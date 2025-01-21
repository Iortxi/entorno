
from libqtile import widget
from .theme import colors
import subprocess ; from libqtile.widget import GenPollText


def base(fg='text', bg='dark'): 
    return {
        'foreground': colors[fg],
        'background': colors[bg]
    }


def separator():
    return widget.Sep(**base(), linewidth=0, padding=5)


def icon(fg='text', bg='dark', fontsize=16, text="?"):
    return widget.TextBox(
        **base(fg, bg),
        fontsize=fontsize,
        text=text,
        padding=3
    )


def powerline(fg="light", bg="dark"):
    return widget.TextBox(
        **base(fg, bg),
        text="", # Icon: nf-oct-triangle_left
        fontsize=37,
        padding=-2
    )


def workspaces(): 
    return [
        separator(),
        widget.GroupBox(
            **base(fg='light'),
            font='UbuntuMono Nerd Font',
            fontsize=19,
            margin_y=3,
            margin_x=0,
            padding_y=8,
            padding_x=5,
            borderwidth=1,
            active=colors['active'],
            inactive=colors['inactive'],
            rounded=False,
            highlight_method='block',
            urgent_alert_method='block',
            urgent_border=colors['urgent'],
            this_current_screen_border=colors['focus'],
            this_screen_border=colors['grey'],
            other_current_screen_border=colors['dark'],
            other_screen_border=colors['dark'],
            disable_drag=True
        ),
        separator(),
        widget.WindowName(**base(fg='focus'), fontsize=14, padding=5),
        separator(),
    ]


primary_widgets = [
    *workspaces(),

    separator(),

    powerline('color5', 'dark'),

    # Check updates
    icon(bg="color5", text=' '),
    widget.CheckUpdates(
        **base(bg='color5'),
        colour_have_updates=colors['text'],
        colour_no_updates=colors['text'],
        no_update_string='0',
        display_format='{updates}',
        update_interval=900,
    ),

    powerline('color4', 'color5'),

    # Interface net traffic
    icon(bg="color4", text=' '),
    widget.Net(**base(bg='color4'), interface='eth0'),

    powerline('color3', 'color4'),

    # CPU
    icon(bg="color3", text=' '),
    widget.CPU(
        **base(bg='color3'),
        format='{load_percent}%',
        update_interval=3,
    ),

    powerline('color2', 'color3'),

    # RAM
    icon(bg="color2", text=" "),
    # widget.Memory(
    #     **base(bg='color2'),
    #     format='{MemUsed:.0f}{mm}',
    #     # measure_mem='G',
    #     update_interval=3,
    # ),
    GenPollText(
        func=lambda: subprocess.check_output("free -h | grep 'Mem' | awk '{print $3}'", shell=True, text=True).strip(),
        foreground=colors["text"],
        background=colors["color2"],
        update_interval=3,
    ),

    powerline('color1', 'color2'),

    # Date
    icon(bg="color1", fontsize=16, text=' '),
    widget.Clock(**base(bg='color1'), format='%d/%m/%Y - %H:%M '),

    powerline('dark', 'color1'),

    # Systray
    widget.Systray(background=colors['dark'], padding=5),
]


secondary_widgets = [
    *workspaces(),
    separator(),

    powerline('color1', 'dark'),

    # Date
    icon(bg="color1", fontsize=16, text=' '),
    widget.Clock(**base(bg='color1'), format='%d/%m/%Y - %H:%M '),

    powerline('dark', 'color1'),
]


widget_defaults = {
    'font': 'UbuntuMono Nerd Font Bold',
    'fontsize': 16,
    'padding': 1,
}

extension_defaults = widget_defaults.copy()
