# Neplach VPN routing configs

Публичные routing-only конфиги для клиентов VPN. Здесь нет серверных адресов,
приватных ключей, паролей или персональных подписок: только правила роутинга.

## Быстрые ссылки

| Клиент | Добавить / скачать | Что внутри |
| --- | --- | --- |
| Shadowrocket | [Скачать конфиг](https://raw.githubusercontent.com/zinovevvv/vpn/main/configs/shadowrocket/neplach-routing.conf) | `.conf` с правилами: РФ и локальная сеть напрямую, Telegram/заблокированные ресурсы через proxy, остальное через proxy |
| Karing | [Скачать JSON](https://raw.githubusercontent.com/zinovevvv/vpn/main/configs/karing/diversion_rules_custom.json) | `diversion_rules_custom.json` с custom diversion rules |
| HAPP | [Открыть инструкцию](docs/happ.md) | инструкция по добавлению routing-конфига в HAPP |

## Как обновлять

1. Измени файл в `configs/`.
2. Сделай commit и push в GitHub.
3. У пользователей обновится тот же raw URL, ссылку менять не нужно.

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
