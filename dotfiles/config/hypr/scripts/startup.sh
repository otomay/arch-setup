#!/bin/bash


hyprctl dispatch workspace 3 && betterbird &
sleep 10
hyprctl dispatch workspace 1 && brave &
sleep 10
hyprctl dispatch workspace 2 && ferdium &
sleep 10
hyprctl dispatch workspace special:magic && kitty &
sleep 10
hyprctl dispatch workspace special:llm && notion-app &