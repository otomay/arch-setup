# Iniciar Hyprland automaticamente no login do tty1
if [ "$(tty)" = "/dev/tty1" ]; then
    exec Hyprland
fi
