cd ~/arch-setup

mkdir -p dotfiles/{git,zsh,config}

# Git
cp -f ~/.gitconfig dotfiles/git/

# Zsh
cp -f ~/.zshrc dotfiles/zsh/

# Criar a pasta de temas corretamente
mkdir -p dotfiles/zsh/.oh-my-zsh/themes
cp -f ~/.oh-my-zsh/themes/bira.zsh-theme dotfiles/zsh/.oh-my-zsh/themes/

# Configs
for d in gtk-3.0 gtk-4.0 hypr hyprpanel kitty qt5ct qt6ct rofi; do
    cp -rf ~/.config/$d dotfiles/config/
done

# ===

mkdir -p pkglist
yay -Qqe > pkglist/yay-packages.txt

git add .
git commit -m "Backup automático $(date '+%Y-%m-%d %H:%M:%S')" || echo "Nada para commitar"
git push origin main || echo "Falha no push."