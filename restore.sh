#!/usr/bin/env bash
set -euo pipefail

# Caminho base onde o backup está armazenado
BASE_DIR=~/arch-setup

echo "==> Restaurando pacotes do sistema..."

# Verifica se há listas de pacotes
if [[ -f "$BASE_DIR/pkglist/pacman-packages.txt" ]]; then
    echo "Instalando pacotes do pacman..."
    sudo pacman -S --needed - < "$BASE_DIR/pkglist/pacman-packages.txt"
fi

# Restaura pacotes AUR via yay, se disponível
if command -v yay >/dev/null 2>&1 && [[ -f "$BASE_DIR/pkglist/yay-packages.txt" ]]; then
    echo "Instalando pacotes do AUR (yay)..."
    yay -S --needed - < "$BASE_DIR/pkglist/yay-packages.txt"
else
    echo "Aviso: yay não encontrado. Instale-o manualmente para restaurar pacotes AUR."
fi

echo "==> Restaurando dotfiles..."

# Git
if [[ -f "$BASE_DIR/dotfiles/git/.gitconfig" ]]; then
    cp -f "$BASE_DIR/dotfiles/git/.gitconfig" ~/.gitconfig
fi

# Zsh
if [[ -f "$BASE_DIR/dotfiles/zsh/.zshrc" ]]; then
    cp -f "$BASE_DIR/dotfiles/zsh/.zshrc" ~/.zshrc
fi

# Tema do Oh My Zsh
if [[ -d "$BASE_DIR/dotfiles/zsh/.oh-my-zsh/themes" ]]; then
    mkdir -p ~/.oh-my-zsh/themes
    cp -f "$BASE_DIR/dotfiles/zsh/.oh-my-zsh/themes/"* ~/.oh-my-zsh/themes/
fi

# Configs
if [[ -d "$BASE_DIR/dotfiles/config" ]]; then
    echo "Restaurando diretórios de configuração..."
    mkdir -p ~/.config
    for d in "$BASE_DIR"/dotfiles/config/*; do
        target="$HOME/.config/$(basename "$d")"
        echo " → Copiando $(basename "$d")"
        rm -rf "$target"
        cp -rf "$d" "$target"
    done
fi

echo "==> Restauração concluída!"
echo "Recomenda-se reiniciar o sistema ou reabrir a sessão para aplicar temas e shell."
