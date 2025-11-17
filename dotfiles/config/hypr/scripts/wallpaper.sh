#!/bin/bash

# Diretórios de origem
DIRS=(
    "$HOME/walls/manga"
    "$HOME/walls/radium"
    "$HOME/walls/pixel"
    "$HOME/walls/outrun"
    "$HOME/walls/anime"
    "$HOME/walls/fauna"
    "$HOME/walls/evangelion"
    "$HOME/walls/aerial"
    "$HOME/walls/apocalypse"
    "$HOME/walls/centered"
    "$HOME/walls/chillop"
    "$HOME/walls/gruvbox"
    "$HOME/walls/m-26.jp"
    "$HOME/walls/nord"
    "$HOME/walls/radium"
    "$HOME/walls/stalenhag"

)

# Diretório de destino para os symlinks
TARGET_DIR="$HOME/wallpapers"

echo "Gerando lista de imagens válidas..."

# Coleta imagens válidas
mapfile -t ALL_WALLS < <(find "${DIRS[@]}" -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' \))

VALID_WALLS=()

for img in "${ALL_WALLS[@]}"; do
    info=$(file "$img")
    if [[ $info =~ ([0-9]+)x([0-9]+) ]]; then
        width=${BASH_REMATCH[1]}
        height=${BASH_REMATCH[2]}
        # Somente >=1920x1080 e formato paisagem
        if (( width >= 1920 && height >= 1080 && width > height )); then
            VALID_WALLS+=("$img")
        fi
    fi
done

echo "Foram encontradas ${#VALID_WALLS[@]} imagens válidas."

# Cria o diretório de destino se não existir
mkdir -p "$TARGET_DIR"

# Limpa symlinks antigos (somente links simbólicos)
find "$TARGET_DIR" -maxdepth 1 -type l -exec rm -f {} \;

# Cria novos symlinks
for img in "${VALID_WALLS[@]}"; do
    link_name="$TARGET_DIR/$(basename "$img")"
    # Evita conflito de nomes
    if [[ -e "$link_name" && ! -L "$link_name" ]]; then
        echo "Aviso: arquivo existente não é link, pulando $link_name"
        continue
    fi
    ln -sf "$img" "$link_name"
done

echo "Symlinks criados com sucesso em $TARGET_DIR"
