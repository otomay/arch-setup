#!/bin/bash
set -e

sudo pacman -Syu --noconfirm

sudo pacman -S --noconfirm ttf-font-awesome ttf-jetbrains-mono-nerd ttf-droid \
    ttf-roboto ttf-dejavu noto-fonts noto-fonts-emoji ttf-liberation

sudo pacman -S --noconfirm gst-libav gst-plugins-base gst-plugins-bad gst-plugins-good \
    gst-plugins-ugly ffmpeg gstreamer neovim

sudo pacman -S --noconfirm hyprland hyprlock hypridle hyprcursor hyprpaper hyprpicker waybar kitty

sudo pacman -S --noconfirm xdg-desktop-portal xdg-desktop-portal-hyprland xdg-desktop-portal-gtk

sudo pacman -S --noconfirm zip unzip tar dunst cliphist mpv pavucontrol xdg-user-dirs-gtk

sudo pacman -S --noconfirm --needed dolphin dolphin-plugins ark kio-admin polkit-kde-agent gnome-keyring \
    qt5-wayland qt6-wayland firefox flatpak

sudo pacman -S --noconfirm breeze breeze5 breeze-gtk papirus-icon-theme nwg-look

sudo pacman -S --noconfirm intel-ucode

sudo pacman -S --noconfirm rofi-wayland

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd .. && rm -rf yay

yay -S --noconfirm hyprshot wlogout qview visual-studio-code-bin brave-bin qt5ct-kde qt6ct-kde

# ================ lazyvim

# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

sh -c "$(curl -fsSL https://install.ohmyz.sh/)"

# systemctl --user enable pipewire pipewire-pulse wireplumber