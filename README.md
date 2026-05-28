# Neplach VPN

Инструкция для подключения VPN и публичные routing-only конфиги для
дополнительных клиентов. Здесь нет серверных адресов, приватных ключей,
паролей или персональных подписок.

## Быстрые действия

| Клиент | Действие | Для чего |
| --- | --- | --- |
| HAPP | установить приложение и добавить личную ссылку-подписку | основной вариант подключения |
| Shadowrocket | [скачать routing `.conf`](https://raw.githubusercontent.com/zinovevvv/vpn/main/configs/shadowrocket/neplach-routing.conf) | дополнительный routing-only конфиг |
| Karing | [скачать routing JSON](https://raw.githubusercontent.com/zinovevvv/vpn/main/configs/karing/diversion_rules_custom.json) | дополнительный routing-only конфиг |

Для HAPP публичный routing-файл не нужен: приложение подключается через личную
ссылку-подписку. Эту ссылку выдают отдельно, в публичный GitHub ее добавлять
нельзя.

## Как подключиться через HAPP

1. Установи HAPP под свое устройство.
2. Скопируй свою ссылку-подписку.
3. Открой HAPP и добавь подписку по ссылке.
4. После добавления появится список стран/профилей. Отсортируй их по скорости или пингу.
5. Выбирай один из быстрых профилей. Нормальный пинг обычно до `100 ms`; если работает плохо, выбери следующий быстрый профиль.

В подписке могут быть отдельные профили для работы через белые списки. Для них
нужно выбирать профиль под своего оператора связи.

Если приложение просит разрешить VPN-профиль или создание VPN-подключения, это
нормально: iOS и Android показывают такой системный запрос при первом запуске.

## Скачать HAPP

| Устройство | Ссылка | Комментарий |
| --- | --- | --- |
| iOS / iPadOS | [App Store Global](https://apps.apple.com/us/app/happ-proxy-utility/id6504287215) / [App Store RU](https://apps.apple.com/ru/app/happ-proxy-utility-plus/id6746188973) | если одна ссылка не открылась, попробуй вторую |
| Android | [Google Play](https://play.google.com/store/apps/details?id=com.happproxy) / [APK](https://github.com/Happ-proxy/happ-android/releases/latest/download/Happ.apk) | APK нужен, если Google Play недоступен |
| Windows | [HAPP для Windows](https://github.com/Happ-proxy/happ-desktop/releases/latest/download/setup-Happ.x64.exe) | установщик `.exe` |
| macOS | [HAPP для macOS](https://github.com/Happ-proxy/happ-desktop/releases/latest/download/Happ.macOS.universal.dmg) | универсальный `.dmg` для Intel и Apple Silicon |
| Все платформы | [официальный GitHub HAPP](https://github.com/Happ-proxy/happ-android) | iOS, Android, Windows, macOS и Linux |

## Дополнительные клиенты

Shadowrocket и Karing можно использовать, если HAPP по какой-то причине не
подходит или если нужны отдельные routing-only правила. Эти файлы не заменяют
VPN-подписку: они нужны только как дополнительные правила роутинга.

### Shadowrocket

Routing config:

<https://raw.githubusercontent.com/zinovevvv/vpn/main/configs/shadowrocket/neplach-routing.conf>

1. Скопируй ссылку выше.
2. В Shadowrocket открой `Config` -> `+` -> `Download from URL` / `Import from URL`.
3. Вставь URL и скачай конфиг.

### Karing

Routing rules:

<https://raw.githubusercontent.com/zinovevvv/vpn/main/configs/karing/diversion_rules_custom.json>

В Karing используй raw-ссылку как remote rule set или скачай файл и импортируй
его вручную в custom diversion rules.

## Безопасность

Не добавляй сюда:

- VPN-профили с приватными ключами;
- подписки, где внутри есть персональные серверы, UUID, токены или пароли.

Такие файлы должны оставаться локально, например в `local/archive/`, или в
приватном репозитории.

## Как обновлять репозиторий

1. Измени публичный файл в `configs/` или эту инструкцию.
2. Сделай commit и push в GitHub.
3. У пользователей обновится тот же raw URL, ссылку менять не нужно.
