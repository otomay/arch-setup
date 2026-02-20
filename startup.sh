#!/bin/bash

# Aguarda o Hyprland iniciar completamente
sleep 2

# Workspace 1 - Brave
hyprctl dispatch exec "[workspace 1 silent]" brave

sleep 1

# Workspace 2 - Ferdium + Slack
hyprctl dispatch exec "[workspace 2 silent]" ferdium

sleep 1

# Workspace 3 - Thunderbird
hyprctl dispatch exec "[workspace 3 silent]" thunderbird

sleep 1

hyprctl dispatch exec "[workspace special:1 silent]" kitty
