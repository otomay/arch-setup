#!/bin/bash

# Função de debug
log() {
    echo "[hypr-toggle] $1"
}

# Verifica se HDMI-A-1 está conectado
hdmi_connected=$(hyprctl monitors all | grep -q "HDMI-A-1 (ID" && echo true || echo false)

if [[ "$hdmi_connected" == true ]]; then
    if hyprctl monitors | grep -q "eDP-1 (ID"; then
        log "Desativando eDP-1 e ativando HDMI-A-1."
        #hyprctl keyword monitor "eDP-1,disable"
        sleep 1
        #hyprctl keyword monitor "HDMI-A-1,1920x1080@240,0x0,1"
    else
        log "Ativando eDP-1 e desativando HDMI-A-1."
        #hyprctl keyword monitor "eDP-1,1920x1080@60,1920x0,1.25"
        sleep 1
        #hyprctl keyword monitor "HDMI-A-1,disable"
    fi
fi