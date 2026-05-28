# Neplach VPN

Инструкции и публичные routing-only конфиги для VPN-клиентов. Здесь нет
серверных адресов, приватных ключей, паролей или персональных подписок.

## Как подключиться

1. Установи VPN-клиент под свое устройство.
2. Скопируй свою ссылку-подписку. Ее выдают отдельно, в этот публичный репозиторий она не добавляется.
3. Открой приложение и добавь подписку по ссылке.
4. После добавления появится список стран/профилей. Отсортируй их по скорости или пингу.
5. Выбирай один из быстрых профилей. Нормальный пинг обычно до `100 ms`; если работает плохо, выбери следующий быстрый профиль.

В подписке могут быть отдельные профили для работы через белые списки. Для них
нужно выбирать профиль под своего оператора связи.

## Скачать приложения

| Устройство | Ссылка | Комментарий |
| --- | --- | --- |
| iOS / iPadOS | [BlancVPN для iOS](https://blancvpn.com/get/ios) | можно также найти `Blanc VPN` в App Store |
| Android | [BlancVPN для Android](https://blancvpn.com/get/android) | установка через Google Play |
| Windows | [BlancVPN для Windows](https://blancvpn.com/get/windows) | на Windows BlancVPN рекомендует V2Ray-клиент |
| macOS | [BlancVPN для macOS](https://blancvpn.com/get/mac) | официальное приложение BlancVPN |
| Все устройства | [общая страница скачивания](https://blankvpn.info/download/) | iOS, Android, Windows, macOS, Linux и роутеры |

Если приложение просит разрешить VPN-профиль или создание VPN-подключения, это
нормально: iOS и Android показывают такой системный запрос при первом запуске.

## Публичные routing-конфиги

| Клиент | Добавить / скачать | Что внутри |
| --- | --- | --- |
| Shadowrocket | [Скачать конфиг](https://raw.githubusercontent.com/zinovevvv/vpn/main/configs/shadowrocket/neplach-routing.conf) | `.conf` с правилами: РФ и локальная сеть напрямую, Telegram/заблокированные ресурсы через proxy, остальное через proxy |
| Karing | [Скачать JSON](https://raw.githubusercontent.com/zinovevvv/vpn/main/configs/karing/diversion_rules_custom.json) | `diversion_rules_custom.json` с custom diversion rules |
| HAPP | [Открыть инструкцию](docs/happ.md) | инструкция по добавлению routing-конфига в HAPP |

Эти файлы не заменяют VPN-подписку. Они нужны как дополнительные правила
роутинга для клиентов, которые умеют импортировать внешние конфиги или custom
rules.

## Shadowrocket

1. Открой ссылку: <https://raw.githubusercontent.com/zinovevvv/vpn/main/configs/shadowrocket/neplach-routing.conf>
2. Скопируй URL.
3. В Shadowrocket открой `Config` -> `+` -> `Download from URL` / `Import from URL`.
4. Вставь URL и скачай конфиг.

Подробнее: [docs/shadowrocket.md](docs/shadowrocket.md).

## Karing

<https://raw.githubusercontent.com/zinovevvv/vpn/main/configs/karing/diversion_rules_custom.json>

В Karing используй raw-ссылку как remote rule set или скачай файл и импортируй
его вручную в custom diversion rules. Документация Karing отдельно описывает
deep link `karing://install-config?...`, но для этого файла надежнее raw URL,
потому что это именно набор diversion rules, а не полный профиль с серверами.

Подробнее: [docs/karing.md](docs/karing.md).

## HAPP

Открой [docs/happ.md](docs/happ.md) на устройстве, где установлен HAPP. Там
лежит короткая инструкция по добавлению routing-конфига в клиент.

Подробнее: [docs/happ.md](docs/happ.md).

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
