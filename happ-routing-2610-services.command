#!/bin/zsh
set -euo pipefail

APP="/Applications/Happ Desktop.app"
ROUTING_URL="https://raw.githubusercontent.com/zinovevvv/vpn/main/configs/happ/neplach-routing.json"

if [[ ! -d "$APP" ]]; then
  print -u2 "Happ Desktop не найден: $APP"
  exit 1
fi
TEMP_JSON="$(mktemp)"
trap 'rm -f "$TEMP_JSON"' EXIT
curl --fail --location --silent --show-error --proto '=https' --tlsv1.2 "$ROUTING_URL" -o "$TEMP_JSON"
ROUTE_BASE64="$(python3 -c 'import json,sys,base64; data=json.load(open(sys.argv[1], encoding="utf-8")); payload=json.dumps(data, ensure_ascii=False, separators=(",", ":")).encode(); print(base64.b64encode(payload).decode())' "$TEMP_JSON")"
printf '%s' "happ://routing/onadd/$ROUTE_BASE64" | pbcopy
open -a "$APP"
print "Ссылка Neplach routing скопирована. В Happ Desktop открой Settings → Routing Rules → ⋯ → Import Profile from Clipboard."
print "Затем выбери обычную VPN-подписку и подтверди Import. URL-схема не открывалась, поэтому старая HAPP не должна перехватить импорт."
