#!/bin/bash

# lid-handler.sh - Gerencia eventos de tampa do notebook no Hyprland
# Uso: lid-handler.sh [close|open]
#
# Lógica:
#   Com monitor externo → hl.monitor(disabled=true/false) — workspaces migram
#   Sem monitor externo → DPMS (desliga/religa o painel via DRM)
#                         evita o bug EBUSY do aquamarine que impede religar
#                         o eDP-1 depois de desabilitado como monitor único

ACTION="$1"

# ── helpers ──────────────────────────────────────────────────────────────

log() {
    echo "[lid-handler] $*"
}

# Retorna 0 (true) se houver algum monitor externo conectado
has_external_monitor() {
    local monitors
    monitors=$(hyprctl monitors all 2>/dev/null)
    local count
    count=$(echo "$monitors" | grep -c '^Monitor ')
    if [ "$count" -gt 1 ]; then
        return 0
    elif [ "$count" -eq 1 ]; then
        if ! echo "$monitors" | grep -q "^[[:space:]]*Monitor eDP-1"; then
            return 0
        fi
    fi
    return 1
}

# ── ações ────────────────────────────────────────────────────────────────

do_close() {
    if has_external_monitor; then
        log "externo detectado → desabilitando eDP-1 (disabled=true)"
        hyprctl eval 'hl.monitor({ output = "eDP-1", disabled = true })'
    else
        log "sem externo → DPMS off (desliga o painel via DRM)"
        hyprctl eval 'hl.dispatch(hl.dsp.dpms({ action = "off" }))'
    fi
}

do_open() {
    if has_external_monitor; then
        log "externo detectado → reabilitando eDP-1 (disabled=false)"
        hyprctl eval 'hl.monitor({ output = "eDP-1", disabled = false })'
    else
        log "sem externo → DPMS on (religa o painel)"
        hyprctl eval 'hl.dispatch(hl.dsp.dpms({ action = "on" }))'
    fi
}

# ── dispatch ─────────────────────────────────────────────────────────────

case "$ACTION" in
    close) do_close ;;
    open)  do_open  ;;
    *)
        echo "Uso: lid-handler.sh [close|open]"
        exit 1
        ;;
esac
