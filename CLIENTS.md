# Другие клиенты

[← Назад](README.md)

## Shadowrocket · iOS

[Скачать в App Store](https://apps.apple.com/us/app/shadowrocket/id932747118)

**Добавить routing:**

1. Скопируй ссылку на конфиг:
   ```
   https://raw.githubusercontent.com/zinovevvv/vpn/main/configs/shadowrocket/neplach-routing.conf
   ```
2. Shadowrocket → `Config` → `+` → `Download from URL` → вставь ссылку.
3. Нажми на конфиг и выбери **Use config**.

---

## Karing · Android

[Google Play](https://play.google.com/store/apps/details?id=com.nebula.karing) · [GitHub Releases](https://github.com/KaringX/karing/releases)

**Добавить routing:**

Добавь как remote rule set, используя ссылку:
```
https://raw.githubusercontent.com/zinovevvv/vpn/main/configs/karing/diversion_rules_custom.json
```

---

## Hiddify · iOS / Android / Windows / macOS

[iOS](https://apps.apple.com/us/app/hiddify-proxy-vpn/id6596777532) · [Android](https://play.google.com/store/apps/details?id=app.hiddify.com) · [Windows / macOS](https://github.com/hiddify/hiddify-app)

> **Важно:** кастомный routing-конфиг в Hiddify 4.x не поддерживается ни через импорт, ни через UI. В качестве частичной замены: Настройки → Маршрутизация → Регион: **Россия (ru)** — встроенный bypass на основе `geoip:ru`.
