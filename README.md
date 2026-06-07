# Neplach VPN

## 1. Скачать приложение

| Устройство | HAPP |
| --- | --- |
| iOS / iPadOS | [App Store Global](https://apps.apple.com/us/app/happ-proxy-utility/id6504287215) / [App Store RU](https://apps.apple.com/ru/app/happ-proxy-utility-plus/id6746188973) |
| Android | [Google Play](https://play.google.com/store/apps/details?id=com.happproxy) / [APK с GitHub](https://github.com/Happ-proxy/happ-android/releases/latest/download/Happ.apk) |
| Windows | [HAPP для Windows](https://github.com/Happ-proxy/happ-desktop/releases/latest/download/setup-Happ.x64.exe) |
| macOS | [HAPP для macOS](https://github.com/Happ-proxy/happ-desktop/releases/latest/download/Happ.macOS.universal.dmg) |
| Все платформы | [GitHub HAPP](https://github.com/Happ-proxy) |

Дополнительные клиенты:

- [Hiddify для iOS](https://apps.apple.com/us/app/hiddify-proxy-vpn/id6596777532) / [Android](https://play.google.com/store/apps/details?id=app.hiddify.com) / [Windows/macOS](https://github.com/hiddify/hiddify-app)
- [Shadowrocket для iOS](https://apps.apple.com/us/app/shadowrocket/id932747118)
- [Karing для Android](https://play.google.com/store/apps/details?id=com.nebula.karing)
- [Karing releases на GitHub](https://github.com/KaringX/karing/releases)

## 2. Настройка подключения

Сначала добавь личную подписку — её выдаёт администратор.

1. Скопируй ссылку-подписку в буфер обмена.
2. Открой HAPP → нажми `+` → добавь подписку из буфера, по QR-коду или deeplink.
3. Разреши подключение, если система попросит.
4. Выбери быстрый профиль — нормальный пинг до 100 мс.

## 3. Routing-конфиги

Правила маршрутизации трафика: прямое подключение для российских доменов и IP, прокси для остальных.

| Клиент | Как добавить |
| --- | --- |
| HAPP | [Страница настройки](https://raw.githack.com/zinovevvv/vpn/main/happ-routing.html) → «Добавить в HAPP» |
| Shadowrocket | [neplach-routing.conf](https://raw.githubusercontent.com/zinovevvv/vpn/main/configs/shadowrocket/neplach-routing.conf) — `Config` → `+` → `Download from URL` |
| Karing | [diversion_rules_custom.json](https://raw.githubusercontent.com/zinovevvv/vpn/main/configs/karing/diversion_rules_custom.json) — добавить как remote rule set |

---

*Используй в соответствии с законодательством страны пребывания. Репозиторий содержит технические правила маршрутизации сети и не предоставляет серверы или подписки.*
