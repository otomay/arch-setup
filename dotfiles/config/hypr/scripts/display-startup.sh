#!/bin/bash

# Função de debug
log() {
    echo "[hypr-toggle] $1"
}

sleep 10

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
    hyprctl eval 'hl.monitor({ output = "eDP-1", disabled = true })'

    if [[ "$hdmi_connected" == true ]]; then
        log "Ativando HDMI-A-1."
        hyprctl eval 'hl.monitor({ output = "HDMI-A-1", disabled = false })'
    else
        log "HDMI-A-1 não conectado. Nenhum monitor ativo!"
    fi

    exit 0
fi