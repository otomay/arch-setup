#!/bin/bash

# Pastas que você curte
DIRS=(
    "$HOME/walls/manga"
    "$HOME/walls/radium"
    "$HOME/walls/pixel"
    "$HOME/walls/outrun"
    "$HOME/walls/anime"
    "$HOME/walls/fauna"
    "$HOME/walls/evangelion"
)

# Coleta todos os arquivos de imagem válidos
WALLS=$(find "${DIRS[@]}" -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' \))

# Loop infinito que troca a cada 5 minutos
while true; do
    WALL=$(shuf -n1 <<< "$WALLS")
    echo "preload = $WALL" > /tmp/hyprpaper.conf
    echo "wallpaper = ,$WALL" >> /tmp/hyprpaper.conf
    killall hyprpaper 2>/dev/null
    hyprpaper -c /tmp/hyprpaper.conf &
    sleep 300
done
