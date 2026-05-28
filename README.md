# Neplach VPN

Общая инструкция по подключению VPN и публичные routing-only конфиги для
дополнительных клиентов. Здесь нет серверных адресов, приватных ключей,
паролей или персональных подписок.

## 1. Скачать приложение

Основной клиент: HAPP.

| Устройство | Ссылка | Комментарий |
| --- | --- | --- |
| iOS / iPadOS | [App Store Global](https://apps.apple.com/us/app/happ-proxy-utility/id6504287215) / [App Store RU](https://apps.apple.com/ru/app/happ-proxy-utility-plus/id6746188973) | если одна ссылка не открылась, попробуй вторую |
| Android | [Google Play](https://play.google.com/store/apps/details?id=com.happproxy) / [APK](https://github.com/Happ-proxy/happ-android/releases/latest/download/Happ.apk) | APK нужен, если Google Play недоступен |
| Windows | [HAPP для Windows](https://github.com/Happ-proxy/happ-desktop/releases/latest/download/setup-Happ.x64.exe) | установщик `.exe` |
| macOS | [HAPP для macOS](https://github.com/Happ-proxy/happ-desktop/releases/latest/download/Happ.macOS.universal.dmg) | универсальный `.dmg` для Intel и Apple Silicon |
| Все платформы | [официальный GitHub HAPP](https://github.com/Happ-proxy/happ-android) | iOS, Android, Windows, macOS и Linux |

## 2. Первичная настройка

1. Скопируй свою личную ссылку-подписку. Ее выдают отдельно.
2. Открой HAPP и добавь подписку по ссылке.
3. Если приложение просит разрешить VPN-профиль или создать VPN-подключение, разреши. Это стандартный системный запрос iOS/Android.
4. После добавления появится список стран/профилей.
5. Отсортируй профили по скорости или пингу.
6. Выбирай один из быстрых профилей. Нормальный пинг обычно до `100 ms`.
7. Если работает плохо, выбери следующий быстрый профиль.

В подписке могут быть отдельные профили для работы через белые списки. Для них
нужно выбирать профиль под своего оператора связи.

Личную ссылку-подписку нельзя добавлять в публичный GitHub: внутри могут быть
персональные серверы, ключи или токены.

## 3. Routing-конфиги

Routing-конфиги не заменяют VPN-подписку. Они нужны как дополнительные правила
роутинга для клиентов, которые умеют импортировать внешние конфиги или custom
rules.

| Клиент | Добавить / скачать | Как использовать |
| --- | --- | --- |
| Shadowrocket | [скачать routing `.conf`](https://raw.githubusercontent.com/zinovevvv/vpn/main/configs/shadowrocket/neplach-routing.conf) | `Config` -> `+` -> `Download from URL` / `Import from URL`, затем вставить ссылку |
| Karing | [скачать routing JSON](https://raw.githubusercontent.com/zinovevvv/vpn/main/configs/karing/diversion_rules_custom.json) | добавить raw-ссылку как remote rule set или импортировать скачанный JSON в custom rules |

Прямые ссылки:

```text
https://raw.githubusercontent.com/zinovevvv/vpn/main/configs/shadowrocket/neplach-routing.conf
https://raw.githubusercontent.com/zinovevvv/vpn/main/configs/karing/diversion_rules_custom.json
```

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
