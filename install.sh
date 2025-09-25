#!/bin/bash
set -e

sudo pacman -Syu --noconfirm

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd .. && rm -rf yay

# ================ lazyvim

# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

# ================ oh my zsh

# Install Oh My ZSH
echo "Installing Oh My ZSH..."
sh -c "$(curl -fsSL https://install.ohmyz.sh/)"

git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autocomplete
chsh -s $(which zsh)

# systemctl --user enable pipewire pipewire-pulse wireplumber