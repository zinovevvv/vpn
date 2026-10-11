#!/bin/zsh
set -euo pipefail

APP="/Applications/Happ Desktop.app"
ROUTING_JSON="${0:A:h}/configs/happ/neplach-routing.json"

if [[ ! -d "$APP" ]]; then
  print -u2 "Happ Desktop не найден: $APP"
  exit 1
fi
if [[ ! -f "$ROUTING_JSON" ]]; then
  print -u2 "Не найден routing-конфиг: $ROUTING_JSON"
  exit 1
fi

ROUTE_BASE64="$(python3 -c 'import json,sys,base64; data=json.load(open(sys.argv[1], encoding="utf-8")); payload=json.dumps(data, ensure_ascii=False, separators=(",", ":")).encode(); print(base64.b64encode(payload).decode())' "$ROUTING_JSON")"
open -a "$APP" "happ://routing/onadd/$ROUTE_BASE64"
