# Neplach VPN

Инструкции и публичные routing-only конфиги для VPN-клиентов. Здесь нет
серверных адресов, приватных ключей, паролей или персональных подписок.

## Как подключиться через HAPP

1. Установи HAPP под свое устройство.
2. Скопируй свою ссылку-подписку. Ее выдают отдельно, в этот публичный репозиторий она не добавляется.
3. Открой HAPP и добавь подписку по ссылке.
4. После добавления появится список стран/профилей. Отсортируй их по скорости или пингу.
5. Выбирай один из быстрых профилей. Нормальный пинг обычно до `100 ms`; если работает плохо, выбери следующий быстрый профиль.

В подписке могут быть отдельные профили для работы через белые списки. Для них
нужно выбирать профиль под своего оператора связи.

## Скачать HAPP

| Устройство | Ссылка | Комментарий |
| --- | --- | --- |
| iOS / iPadOS | [App Store Global](https://apps.apple.com/us/app/happ-proxy-utility/id6504287215) / [App Store RU](https://apps.apple.com/ru/app/happ-proxy-utility-plus/id6746188973) | если одна ссылка не открылась, попробуй вторую |
| Android | [Google Play](https://play.google.com/store/apps/details?id=com.happproxy) / [APK](https://github.com/Happ-proxy/happ-android/releases/latest/download/Happ.apk) | APK нужен, если Google Play недоступен |
| Windows | [HAPP для Windows](https://github.com/Happ-proxy/happ-desktop/releases/latest/download/setup-Happ.x64.exe) | установщик `.exe` |
| macOS | [HAPP для macOS](https://github.com/Happ-proxy/happ-desktop/releases/latest/download/Happ.macOS.universal.dmg) | универсальный `.dmg` для Intel и Apple Silicon |
| Все платформы | [официальный GitHub HAPP](https://github.com/Happ-proxy/happ-android) | iOS, Android, Windows, macOS и Linux |

Если приложение просит разрешить VPN-профиль или создание VPN-подключения, это
нормально: iOS и Android показывают такой системный запрос при первом запуске.

## Основной клиент

| Клиент | Добавить / скачать | Что внутри |
| --- | --- | --- |
| HAPP | [Открыть инструкцию](docs/happ.md) | основной вариант подключения для сотрудников |

## Дополнительные клиенты

Shadowrocket и Karing можно использовать, если HAPP по какой-то причине не
подходит или если нужны отдельные routing-only правила. Эти файлы не заменяют
VPN-подписку: они нужны как дополнительные правила роутинга для клиентов,
которые умеют импортировать внешние конфиги или custom rules.

| Клиент | Добавить / скачать | Что внутри |
| --- | --- | --- |
| Shadowrocket | [Скачать конфиг](https://raw.githubusercontent.com/zinovevvv/vpn/main/configs/shadowrocket/neplach-routing.conf) | `.conf` с правилами: РФ и локальная сеть напрямую, Telegram/заблокированные ресурсы через proxy, остальное через proxy |
| Karing | [Скачать JSON](https://raw.githubusercontent.com/zinovevvv/vpn/main/configs/karing/diversion_rules_custom.json) | `diversion_rules_custom.json` с custom diversion rules |

## HAPP

Открой [docs/happ.md](docs/happ.md) на устройстве, где установлен HAPP. Там
лежит короткая инструкция по добавлению подписки и routing-конфига в клиент.

Подробнее: [docs/happ.md](docs/happ.md).

## Shadowrocket

Дополнительный клиент.

1. Открой ссылку: <https://raw.githubusercontent.com/zinovevvv/vpn/main/configs/shadowrocket/neplach-routing.conf>
2. Скопируй URL.
3. В Shadowrocket открой `Config` -> `+` -> `Download from URL` / `Import from URL`.
4. Вставь URL и скачай конфиг.

Подробнее: [docs/shadowrocket.md](docs/shadowrocket.md).

## Karing

Дополнительный клиент.

<https://raw.githubusercontent.com/zinovevvv/vpn/main/configs/karing/diversion_rules_custom.json>

В Karing используй raw-ссылку как remote rule set или скачай файл и импортируй
его вручную в custom diversion rules. Документация Karing отдельно описывает
deep link `karing://install-config?...`, но для этого файла надежнее raw URL,
потому что это именно набор diversion rules, а не полный профиль с серверами.

Подробнее: [docs/karing.md](docs/karing.md).

## Безопасность

Не добавляй сюда:

- VPN-профили с приватными ключами;
- подписки, где внутри есть персональные серверы, UUID, токены или пароли.

Такие файлы должны оставаться локально, например в `local/archive/`, или в
приватном репозитории.

## Как обновлять репозиторий

1. Измени публичный файл в `configs/` или инструкцию в `docs/`.
2. Сделай commit и push в GitHub.
3. У пользователей обновится тот же raw URL, ссылку менять не нужно.
