#!/bin/bash

dir="$HOME/.config/rofi/launchers/type-2"
theme='style-8'

# Diretórios com papéis de parede
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
mapfile -t WALLS < <(find "${DIRS[@]}" -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' \))

# Gera uma lista apenas com os nomes dos arquivos
mapfile -t NAMES < <(basename -a "${WALLS[@]}")

# Monta a lista para o rofi, com suporte a ícones (thumbnails)
ROFI_LIST=""
for img in "${WALLS[@]}"; do
    name=$(basename "$img")
    # Cada linha contém o nome + o campo de ícone (thumbnail)
    ROFI_LIST+="$name\0icon\x1f$img\n"
done

# Mostra menu com nomes
selected_name=$(echo -en "$ROFI_LIST" | rofi -dmenu -theme ${dir}/${theme}.rasi -p "Select Wallpaper:")

# Se o usuário escolheu algo
if [[ -n "$selected_name" ]]; then
    # Encontra o caminho completo correspondente ao nome escolhido
    for w in "${WALLS[@]}"; do
        if [[ "$(basename "$w")" == "$selected_name" ]]; then
            selected_wall="$w"
            break
        fi
    done

    awww img "$selected_wall" --transition-type fade --transition-fps 60 --transition-step 100
    wallust run "$selected_wall" -b kmeans -p dark16
    notify-send "Wallpaper changed" "$selected_name"
    exit 0
fi