# Neplach VPN

Общая инструкция по подключению VPN и публичные routing-only конфиги. Здесь
нет серверных адресов, приватных ключей, паролей или персональных подписок.

Основной клиент: HAPP. Shadowrocket и Karing оставлены как дополнительные
варианты для тех, кто уже ими пользуется.

## 1. Скачать приложение

| Устройство | HAPP | Hiddify |
| --- | --- | --- |
| iOS / iPadOS | [App Store Global](https://apps.apple.com/us/app/happ-proxy-utility/id6504287215) / [App Store RU](https://apps.apple.com/ru/app/happ-proxy-utility-plus/id6746188973) | [App Store](https://apps.apple.com/us/app/hiddify-proxy-vpn/id6596777532) |
| Android | [Google Play](https://play.google.com/store/apps/details?id=com.happproxy) / [APK с GitHub](https://github.com/Happ-proxy/happ-android/releases/latest/download/Happ.apk) | [Google Play](https://play.google.com/store/apps/details?id=app.hiddify.com) / [APK с GitHub](https://github.com/hiddify/hiddify-app/releases/latest/download/Hiddify-Android-universal.apk) |
| Windows | [HAPP для Windows](https://github.com/Happ-proxy/happ-desktop/releases/latest/download/setup-Happ.x64.exe) | [Hiddify для Windows](https://github.com/hiddify/hiddify-app/releases/latest/download/Hiddify-Windows-Setup-x64.exe) |
| macOS | [HAPP для macOS](https://github.com/Happ-proxy/happ-desktop/releases/latest/download/Happ.macOS.universal.dmg) | [Hiddify для macOS](https://github.com/hiddify/hiddify-app/releases/latest/download/Hiddify-MacOS.dmg) |
| Все платформы | [официальный GitHub HAPP](https://github.com/Happ-proxy) | [официальный GitHub Hiddify](https://github.com/hiddify/hiddify-app) |

Дополнительные клиенты:

- [Shadowrocket для iOS](https://apps.apple.com/us/app/shadowrocket/id932747118)
- [Karing для Android](https://play.google.com/store/apps/details?id=com.nebula.karing)
- [Karing releases на GitHub](https://github.com/KaringX/karing/releases)

## 2. Первичная настройка VPN

Сначала нужно добавить личную VPN-подписку. Routing-конфиги из раздела ниже
не заменяют подписку: они только добавляют правила, что отправлять через VPN, а
что оставлять напрямую.

1. Получи личную ссылку-подписку у администратора.
2. Скопируй ссылку в буфер обмена.
3. Открой HAPP.
4. Нажми `+` на главном экране.
5. Добавь подписку одним из способов, которые поддерживает HAPP: из буфера
   обмена, по QR-коду или через deeplink.
6. Если HAPP или система попросит разрешить VPN-подключение, разреши.
7. После добавления появится список стран/профилей.
8. Отсортируй профили по пингу или скорости.
9. Выбери быстрый профиль. Нормальный пинг обычно до `100 ms`.
10. Если сайт или приложение работает плохо, выбери следующий быстрый профиль.

В подписке могут быть отдельные профили для работы через белые списки. Для них
нужно выбирать профиль под своего оператора связи.

Личную ссылку-подписку нельзя добавлять в публичный GitHub: внутри могут быть
персональные серверы, ключи или токены.

## 3. Routing-конфиги

Routing-конфиг добавляется после первичной настройки VPN и задаёт правила
трафика: российские IP, домены `.ru`, `.su`, `.рф` и российские сервисы идут
напрямую; зарубежные домены — через VPN; заблокированные сервисы явно выведены
в proxy.

Исключения из правила «иностранный = proxy»: некоторые иностранные сервисы,
которые используются в рабочих целях, принудительно отправляются напрямую.

| Сервис | Домен | Почему напрямую |
| --- | --- | --- |
| AnyDesk | `anydesk.com` | удалённый доступ, VPN ломает работу relay |

### HAPP и Hiddify

Открой страницу и нажми нужную кнопку — роутинг добавится автоматически:

**[→ Добавить роутинг (HAPP / Hiddify)](https://raw.githack.com/zinovevvv/vpn/main/happ-routing.html)**

На странице две кнопки — для HAPP и для Hiddify. Если кнопка не сработала,
есть раздел «Не открылось?» со ссылкой на скачивание JSON-файла для
ручного импорта.

#### Автовыбор сервера для Telegram (только Hiddify)

Конфиг для Hiddify содержит дополнительную логику специально для Telegram:
трафик идёт через группу `telegram-auto` — sing-box `urltest`, который
каждые 3 минуты тестирует задержку через Hiddify-группы `auto` (лучший
сервер из всей подписки) и `proxy` (выбранный вручную). Побеждает тот,
у которого ниже RTT.

Что это даёт на практике:

- Telegram никогда не остаётся «застрявшим» на недоступном сервере.
- Переключение происходит автоматически, без ручного вмешательства.
- Состав серверов в подписке может меняться — конфиг не хардкодит
  конкретные серверы, а работает через динамические группы Hiddify.
- Гистерезис 50 мс предотвращает нестабильное переключение между
  серверами с близкими задержками.

### Другие клиенты

Для Shadowrocket и Karing — только если ты уже пользуешься одним из них:

| Клиент | Файл | Как добавить |
| --- | --- | --- |
| Shadowrocket | [neplach-routing.conf](https://raw.githubusercontent.com/zinovevvv/vpn/main/configs/shadowrocket/neplach-routing.conf) | `Config` → `+` → `Download from URL`, вставить ссылку |
| Karing | [diversion_rules_custom.json](https://raw.githubusercontent.com/zinovevvv/vpn/main/configs/karing/diversion_rules_custom.json) | добавить raw-ссылку как remote rule set или импортировать JSON в custom rules |
| Hiddify | [neplach-routing.json](https://raw.githubusercontent.com/zinovevvv/vpn/main/configs/hiddify/neplach-routing.json) | кнопка на странице выше или скачать JSON и импортировать вручную |

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
