# Neplach VPN

## 1. Скачать приложение

| Устройство | HAPP | Hiddify |
| --- | --- | --- |
| iOS / iPadOS | [App Store Global](https://apps.apple.com/us/app/happ-proxy-utility/id6504287215) / [App Store RU](https://apps.apple.com/ru/app/happ-proxy-utility-plus/id6746188973) | [App Store](https://apps.apple.com/us/app/hiddify-proxy-vpn/id6596777532) |
| Android | [Google Play](https://play.google.com/store/apps/details?id=com.happproxy) / [APK с GitHub](https://github.com/Happ-proxy/happ-android/releases/latest/download/Happ.apk) | [Google Play](https://play.google.com/store/apps/details?id=app.hiddify.com) / [APK с GitHub](https://github.com/hiddify/hiddify-app/releases/latest/download/Hiddify-Android-universal.apk) |
| Windows | [HAPP для Windows](https://github.com/Happ-proxy/happ-desktop/releases/latest/download/setup-Happ.x64.exe) | [Hiddify для Windows](https://github.com/hiddify/hiddify-app/releases/latest/download/Hiddify-Windows-Setup-x64.exe) |
| macOS | [HAPP для macOS](https://github.com/Happ-proxy/happ-desktop/releases/latest/download/Happ.macOS.universal.dmg) | [Hiddify для macOS](https://github.com/hiddify/hiddify-app/releases/latest/download/Hiddify-MacOS.dmg) |
| Все платформы | [GitHub HAPP](https://github.com/Happ-proxy) | [GitHub Hiddify](https://github.com/hiddify/hiddify-app) |

Дополнительные клиенты:

- [Shadowrocket для iOS](https://apps.apple.com/us/app/shadowrocket/id932747118)
- [Karing для Android](https://play.google.com/store/apps/details?id=com.nebula.karing)
- [Karing releases на GitHub](https://github.com/KaringX/karing/releases)

## 2. Настройка VPN

Сначала добавь личную VPN-подписку — её выдаёт администратор.

1. Скопируй ссылку-подписку в буфер обмена.
2. Открой HAPP → нажми `+` → добавь подписку из буфера, по QR-коду или deeplink.
3. Разреши VPN-подключение, если система попросит.
4. Выбери быстрый профиль — нормальный пинг до 100 мс.

## 3. Routing-конфиги

Направляет российские сайты напрямую, всё остальное через VPN.

| Клиент | Как добавить |
| --- | --- |
| HAPP | [Страница настройки](https://raw.githack.com/zinovevvv/vpn/main/happ-routing.html) → «Добавить в HAPP» |
| Hiddify | [Страница настройки](https://raw.githack.com/zinovevvv/vpn/main/happ-routing.html) → вставить ссылку на подписку → «Скачать профиль Hiddify» → в Hiddify: `+` → Импортировать из файла |
| Shadowrocket | [neplach-routing.conf](https://raw.githubusercontent.com/zinovevvv/vpn/main/configs/shadowrocket/neplach-routing.conf) — `Config` → `+` → `Download from URL` |
| Karing | [diversion_rules_custom.json](https://raw.githubusercontent.com/zinovevvv/vpn/main/configs/karing/diversion_rules_custom.json) — добавить как remote rule set |
