#!/bin/bash

# Função de debug
log() {
    echo "[hypr-toggle] $1"
}

# Verifica estado da tampa
lid_state_file=$(find /proc/acpi/button/lid/ -name state | head -n1)
lid_closed=false

if [[ -f "$lid_state_file" ]]; then
    if grep -q 'closed' "$lid_state_file"; then
        lid_closed=true
        log "Tampa do notebook está FECHADA."
    else
        log "Tampa do notebook está ABERTA."
    fi
else
    log "Não foi possível detectar o estado da tampa."
fi

# Verifica se HDMI-A-1 está conectado
hdmi_connected=$(hyprctl monitors | grep -q "HDMI-A-1 (ID" && echo true || echo false)

if [[ "$hdmi_connected" == true ]]; then
    log "Monitor HDMI-A-1 está CONECTADO."
else
    log "Monitor HDMI-A-1 NÃO está conectado."
fi

# Aplica lógica
if [[ "$lid_closed" == true ]]; then
    log "Desligando eDP-1 por causa da tampa fechada."

    if [[ "$hdmi_connected" == true ]]; then
        log "Ativando HDMI-A-1."
        hyprctl keyword monitor "eDP-1,disable"
        sleep 1
        hyprctl keyword monitor "HDMI-A-1,1920x1080@240,0x0,1"
    else
        log "HDMI-A-1 não conectado. Nenhum monitor ativo!"
    fi
    exit 0
fi

# Se tampa aberta, fazer toggle normal entre eDP-1 e HDMI-A-1
if [[ "$hdmi_connected" == true ]]; then
    if hyprctl monitors | grep -q "eDP-1 (ID"; then
        log "Desativando eDP-1 e ativando HDMI-A-1."
        hyprctl keyword monitor "eDP-1,disable"
        hyprctl keyword monitor "HDMI-A-1,1920x1080@240,0x0,1"
    else
        log "Ativando eDP-1 e desativando HDMI-A-1."
        hyprctl keyword monitor "eDP-1,1920x1080@60,0x0,1.25"
        hyprctl keyword monitor "HDMI-A-1,disable"
    fi
fi