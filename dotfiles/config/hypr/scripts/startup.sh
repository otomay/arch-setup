#!/bin/bash


hyprctl dispatch 'hl.dsp.focus({ workspace = "3" })' && betterbird &
sleep 10
hyprctl dispatch 'hl.dsp.focus({ workspace = "1" })' && brave &
sleep 10
hyprctl dispatch 'hl.dsp.focus({ workspace = "2" })' && ferdium &
sleep 10
hyprctl dispatch 'hl.dsp.focus({ workspace = "special:magic" })' && kitty &
sleep 10
hyprctl dispatch 'hl.dsp.focus({ workspace = "special:llm" })' && notion-app &