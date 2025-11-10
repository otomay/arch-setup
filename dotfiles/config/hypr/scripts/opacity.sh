#!/usr/bin/env bash
# ~/.local/bin/hypr-alpha.sh
# uso: hypr-alpha.sh up|down
# aumenta/diminui alpha/alphainactive da janela ativa em 0.1, com fallback e limites.

STEP=0.1
MIN=0.1
MAX=1.0

action="$1"
if [[ "$action" != "up" && "$action" != "down" ]]; then
  echo "usage: $0 up|down" >&2
  exit 2
fi

# tenta obter o valor atual; se vazio, assume 1.0
raw=$(hyprctl getprop active alpha 2>/dev/null | awk '{print $NF}')
cur=${raw:-1.0}

# valida que cur é número; caso contrário assume 1.0
if ! awk "BEGIN{exit !( ($cur+0)==($cur+0) ) }"; then
  cur=1.0
fi

if [[ "$action" == "up" ]]; then
  # "up" => mais opaco (aumenta alpha)
  new=$(awk -v c="$cur" -v s="$STEP" -v M="$MAX" 'BEGIN{v=c+s; if(v>M) v=M; printf("%.3f", v)}')
else
  # "down" => menos opaco (diminui alpha)
  new=$(awk -v c="$cur" -v s="$STEP" -v m="$MIN" 'BEGIN{v=c-s; if(v<m) v=m; printf("%.3f", v)}')
fi

# aplica o mesmo valor para alpha e alphainactive
hyprctl setprop active alpha "$new"
hyprctl setprop active alphainactive "$new"

echo "$cur -> $new"
