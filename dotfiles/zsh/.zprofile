# Iniciar Hyprland automaticamente no login do tty1
if [ "$(tty)" = "/dev/tty1" ]; then
    if uwsm check may-start; then
        #exec uwsm start default
        exec uwsm start hyprland-uwsm.desktop
    fi
fi
