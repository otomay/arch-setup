#!/usr/bin/env bash
set -euo pipefail

BASE_DIR=~/arch-setup

echo "============================"
echo "🚀 Iniciando setup do Arch..."
echo "============================"

# -------------------------------------------------------------
# 1️⃣ Atualizar sistema e instalar yay
# -------------------------------------------------------------
echo "==> Atualizando pacotes base..."
sudo pacman -Syu --noconfirm

if ! command -v yay &>/dev/null; then
    echo "==> Instalando yay (AUR helper)..."
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd .. && rm -rf yay
else
    echo "✓ yay já está instalado."
fi

# -------------------------------------------------------------
# 2️⃣ Instalar e configurar LazyVim (Neovim)
# -------------------------------------------------------------
echo "==> Instalando LazyVim..."
sudo pacman -S --noconfirm neovim

# Fazer backup de configurações antigas
mv ~/.config/nvim{,.bak} 2>/dev/null || true
mv ~/.local/share/nvim{,.bak} 2>/dev/null || true
mv ~/.local/state/nvim{,.bak} 2>/dev/null || true
mv ~/.cache/nvim{,.bak} 2>/dev/null || true

# Clonar starter do LazyVim
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

# -------------------------------------------------------------
# 3️⃣ Instalar e configurar Oh My Zsh
# -------------------------------------------------------------
echo "==> Instalando Oh My ZSH e plugins..."
sudo pacman -S --noconfirm zsh curl

# Instalação do Oh My ZSH
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    sh -c "$(curl -fsSL https://install.ohmyz.sh/)" || true
fi

# Plugins extras
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
mkdir -p "$ZSH_CUSTOM/plugins"

git clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_CUSTOM/plugins/zsh-autosuggestions" || true
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" || true
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git "$ZSH_CUSTOM/plugins/fast-syntax-highlighting" || true
git clone --depth 1 https://github.com/marlonrichert/zsh-autocomplete.git "$ZSH_CUSTOM/plugins/zsh-autocomplete" || true

# -------------------------------------------------------------
# 4️⃣ Restaurar pacotes do backup (com filtro de válidos)
# -------------------------------------------------------------
echo "==> Restaurando pacotes do sistema..."

# Restaura pacotes AUR via yay
if command -v yay >/dev/null 2>&1 && [[ -f "$BASE_DIR/pkglist/yay-packages.txt" ]]; then
    echo "→ Instalando pacotes do AUR..."
    yay -S --needed --noconfirm - < "$BASE_DIR/pkglist/yay-packages.txt" || true
else
    echo "Aviso: yay não encontrado ou lista ausente. Pulando restauração do AUR."
fi

# -------------------------------------------------------------
# 5️⃣ Restaurar dotfiles
# -------------------------------------------------------------
echo "==> Restaurando dotfiles..."

# Git
if [[ -f "$BASE_DIR/dotfiles/git/.gitconfig" ]]; then
    cp -f "$BASE_DIR/dotfiles/git/.gitconfig" ~/.gitconfig
fi

# Zsh
if [[ -f "$BASE_DIR/dotfiles/zsh/.zshrc" ]]; then
    cp -f "$BASE_DIR/dotfiles/zsh/.zshrc" ~/.zshrc
fi

# Zsh
if [[ -f "$BASE_DIR/dotfiles/zsh/.zprofile" ]]; then
    cp -f "$BASE_DIR/dotfiles/zsh/.zprofile" ~/.zprofile
fi

# Tema do Oh My Zsh
if [[ -d "$BASE_DIR/dotfiles/zsh/.oh-my-zsh/themes" ]]; then
    mkdir -p ~/.oh-my-zsh/themes
    cp -f "$BASE_DIR/dotfiles/zsh/.oh-my-zsh/themes/"* ~/.oh-my-zsh/themes/
fi

# Configurações em ~/.config
if [[ -d "$BASE_DIR/dotfiles/config" ]]; then
    echo "→ Restaurando diretórios de configuração..."
    mkdir -p ~/.config
    for d in "$BASE_DIR"/dotfiles/config/*; do
        target="$HOME/.config/$(basename "$d")"
        echo "   Copiando $(basename "$d")"
        rm -rf "$target"
        cp -rf "$d" "$target"
    done
fi

# -------------------------------------------------------------
# 6️⃣ Restaurar autologin no tty1
# -------------------------------------------------------------
if [[ -f "$BASE_DIR/dotfiles/systemd/getty@tty1.service.d/override.conf" ]]; then
    echo "==> Restaurando autologin systemd (tty1)..."
    sudo mkdir -p /etc/systemd/system/getty@tty1.service.d
    sudo cp "$BASE_DIR/dotfiles/systemd/getty@tty1.service.d/override.conf" /etc/systemd/system/getty@tty1.service.d/
    sudo systemctl daemon-reload
    sudo systemctl restart getty@tty1.service
else
    echo "Aviso: override.conf não encontrado — pulando autologin."
fi


# TODO: Adicionar git clone dos wallpapers
# TODO: Adicionar setup dos temas rofi

# -------------------------------------------------------------
# Finalização
# -------------------------------------------------------------
echo "============================"
echo "✅ Setup completo!"
echo "Reinicie ou reabra a sessão para aplicar temas e shell."
echo "============================"

# Define zsh como shell padrão
chsh -s "$(which zsh)"