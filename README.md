# Neplach VPN

Общая инструкция по подключению VPN и публичные routing-only конфиги. Здесь
нет серверных адресов, приватных ключей, паролей или персональных подписок.

Основной клиент: HAPP. Shadowrocket и Karing оставлены как дополнительные
варианты для тех, кто уже ими пользуется.

## 1. Скачать приложение

| Устройство | HAPP |
| --- | --- |
| iOS / iPadOS | [App Store Global](https://apps.apple.com/us/app/happ-proxy-utility/id6504287215) / [App Store RU](https://apps.apple.com/ru/app/happ-proxy-utility-plus/id6746188973) |
| Android | [Google Play](https://play.google.com/store/apps/details?id=com.happproxy) / [APK с GitHub](https://github.com/Happ-proxy/happ-android/releases/latest/download/Happ.apk) |
| Windows | [HAPP для Windows](https://github.com/Happ-proxy/happ-desktop/releases/latest/download/setup-Happ.x64.exe) |
| macOS | [HAPP для macOS](https://github.com/Happ-proxy/happ-desktop/releases/latest/download/Happ.macOS.universal.dmg) |
| Все платформы | [официальный GitHub HAPP](https://github.com/Happ-proxy) |

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

Routing-конфиг можно добавить после первичной настройки VPN. Для HAPP это
отдельный routing-профиль: HAPP поддерживает добавление через буфер обмена,
QR-код или deeplink вида `happ://routing/onadd/...`.

Логика правил: локальная сеть, российские IP, домены `.ru`, `.su`, `.рф` и
российские сервисы с международными доменами идут напрямую. Зарубежные домены
по умолчанию идут через VPN. Заблокированные сервисы и медиа вынесены в proxy
явно и стоят выше direct-правил.

| Клиент | Добавить / скачать | Как использовать |
| --- | --- | --- |
| HAPP | [добавить routing в HAPP][happ-routing-add] / [скачать JSON](https://raw.githubusercontent.com/zinovevvv/vpn/main/configs/happ/neplach-routing.json) | нажать ссылку с телефона, где установлен HAPP; если GitHub не открывает `happ://`, скачать JSON и импортировать его как routing-профиль |
| Shadowrocket | [скачать routing `.conf`](https://raw.githubusercontent.com/zinovevvv/vpn/main/configs/shadowrocket/neplach-routing.conf) | `Config` -> `+` -> `Download from URL` / `Import from URL`, затем вставить ссылку |
| Karing | [скачать routing JSON](https://raw.githubusercontent.com/zinovevvv/vpn/main/configs/karing/diversion_rules_custom.json) | добавить raw-ссылку как remote rule set или импортировать скачанный JSON в custom rules |

Прямые ссылки:

```text
https://raw.githubusercontent.com/zinovevvv/vpn/main/configs/happ/neplach-routing.json
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

[happ-routing-add]: happ://routing/onadd/eyJOYW1lIjoiTmVwbGFjaCByb3V0aW5nIiwiRG9tYWluU3RyYXRlZ3kiOiJJUElmTm9uTWF0Y2giLCJGYWtlRE5TIjpmYWxzZSwiUmVtb3RlRE5TIjoiaHR0cHM6Ly8xLjEuMS4xL2Rucy1xdWVyeSIsIkRpcmVjdEROUyI6IjguOC44LjgiLCJHZW9pcHVybCI6Imh0dHBzOi8vZ2l0aHViLmNvbS9Mb3lhbHNvbGRpZXIvdjJyYXktcnVsZXMtZGF0L3JlbGVhc2VzL2xhdGVzdC9kb3dubG9hZC9nZW9pcC5kYXQiLCJHZW9zaXRldXJsIjoiaHR0cHM6Ly9naXRodWIuY29tL0xveWFsc29sZGllci92MnJheS1ydWxlcy1kYXQvcmVsZWFzZXMvbGF0ZXN0L2Rvd25sb2FkL2dlb3NpdGUuZGF0IiwiUHJveHlTaXRlcyI6WyJnZW9zaXRlOnRlbGVncmFtIiwiZG9tYWluOnRlbGVncmFtLm9yZyIsImRvbWFpbjp0Lm1lIiwiZG9tYWluOnRlbGVncmEucGgiLCJkb21haW46dGRlc2t0b3AuY29tIiwiZG9tYWluOnJ1dHJhY2tlci5vcmciLCJkb21haW46cnV0cmFja2VyLm5sIiwiZG9tYWluOnJ1dG9yLmluZm8iLCJkb21haW46bm5tY2x1Yi50byIsImRvbWFpbjp0b3JyZW50Z2FsYXh5LnRvIiwiZG9tYWluOnRoZXBpcmF0ZWJheS5vcmciLCJkb21haW46bWVkdXphLmlvIiwiZG9tYWluOmJiYy5jb20iLCJkb21haW46YmJjaS5jby51ayIsImRvbWFpbjpjdXJyZW50dGltZS50diIsImRvbWFpbjpkdy5jb20iLCJkb21haW46dHZyYWluLnR2IiwiZG9tYWluOm5vdmF5YWdhemV0YS5ldSIsImRvbWFpbjp0aGVpbnMucnUiLCJkb21haW46YWdlbnRzLm1lZGlhIiwiZG9tYWluOmhvbG9kLm1lZGlhIiwiZG9tYWluOmlzdG9yaWVzLm1lZGlhIiwiZG9tYWluOnN2b2JvZGEub3JnIiwiZG9tYWluOmluc3RhZ3JhbS5jb20iLCJkb21haW46Y2RuaW5zdGFncmFtLmNvbSIsImRvbWFpbjpmYWNlYm9vay5jb20iLCJkb21haW46ZmIuY29tIiwiZG9tYWluOmZiY2RuLm5ldCIsImRvbWFpbjptZXNzZW5nZXIuY29tIiwiZG9tYWluOnR3aXR0ZXIuY29tIiwiZG9tYWluOnguY29tIiwiZG9tYWluOnQuY28iLCJkb21haW46dHdpbWcuY29tIiwiZG9tYWluOmxpbmtlZGluLmNvbSIsImRvbWFpbjpkaXNjb3JkLmNvbSIsImRvbWFpbjpkaXNjb3JkYXBwLmNvbSIsImRvbWFpbjpkaXNjb3JkLmdnIiwiZG9tYWluOnlvdXR1YmUuY29tIiwiZG9tYWluOmdvb2dsZXZpZGVvLmNvbSIsImRvbWFpbjp5dGltZy5jb20iXSwiRGlyZWN0U2l0ZXMiOlsia2V5d29yZDpuZXBsYWNoIiwiZG9tYWluOnZrLmNvbSIsImRvbWFpbjp2a3ZpZGVvLnJ1IiwiZG9tYWluOm9rLnJ1IiwiZG9tYWluOm15LmNvbSIsImRvbWFpbjptYWlsLnJ1IiwiZG9tYWluOnlhbmRleC5ydSIsImRvbWFpbjp5YS5ydSIsImRvbWFpbjp5YW5kZXguY29tIiwiZG9tYWluOnlhbmRleC5uZXQiLCJkb21haW46eWFuZGV4Lm9yZyIsImRvbWFpbjp5YW5kZXhjbG91ZC5uZXQiLCJkb21haW46eWFzdGF0aWMubmV0IiwiZG9tYWluOnlhbmRleC5zdCIsImRvbWFpbjp5YWRpLnNrIiwiZG9tYWluOjJnaXMucnUiLCJkb21haW46Mmdpcy5jb20iLCJkb21haW46ZmxhbXAucnUiLCJkb21haW46dnRiLmNvbSIsImRvbWFpbjp0YmFuay5ydSIsImRvbWFpbjp0aW5rb2ZmLnJ1IiwiZG9tYWluOnNiZXJiYW5rLmNvbSIsImRvbWFpbjpzYmVyYmFuay5ydSIsImRvbWFpbjpzYmVyLnJ1IiwiZG9tYWluOnNiZXJidXNpbmVzcy5ydSIsImRvbWFpbjpzYmVyaWQucnUiLCJkb21haW46c2JlcnByaW1lLnJ1IiwiZG9tYWluOnNiZXJiYW5rLWluc3VyYW5jZS5ydSIsImRvbWFpbjpzYmVyaW5zdXIucnUiLCJkb21haW46c2Jlcm1vYmlsZS5ydSIsImRvbWFpbjpzYmVyZGV2aWNlcy5ydSIsImRvbWFpbjpzYmVyaGVhbHRoLnJ1IiwiZG9tYWluOnNiZXJjbG91ZC5ydSIsImRvbWFpbjpjbG91ZC5ydSIsImRvbWFpbjpkb21jbGljay5ydSIsImRvbWFpbjpzYmVybWVnYW1hcmtldC5ydSIsImRvbWFpbjptZWdhbWFya2V0LnJ1IiwiZG9tYWluOnNiZXJtYXJrZXQucnUiLCJkb21haW46a3VwZXIucnUiLCJkb21haW46c2Ftb2thdC5ydSIsImRvbWFpbjpva2tvLnR2IiwiZG9tYWluOnp2dWsuY29tIiwiZG9tYWluOnNiZXJsb2dpc3RpY3MucnUiLCJkb21haW46c2JlcmF1dG8uY29tIiwiZG9tYWluOmFsZmFiYW5rLnJ1IiwiZG9tYWluOmFsZmEucnUiLCJkb21haW46b3pvbi5ydSIsImRvbWFpbjpvem9uLmNvbSIsImRvbWFpbjp3aWxkYmVycmllcy5ydSIsImRvbWFpbjp3Yi5ydSIsImRvbWFpbjphdml0by5ydSIsImRvbWFpbjphdmlhc2FsZXMucnUiLCJkb21haW46YXZpYXNhbGVzLmNvbSIsImRvbWFpbjp0dXR1LnJ1IiwiZG9tYWluOm9zdHJvdm9rLnJ1IiwiZG9tYWluOm9zdHJvdm9rLmNvbSIsImRvbWFpbjpkZWxpbW9iaWwucnUiLCJkb21haW46YmVsa2FjYXIucnUiLCJkb21haW46Y2l0eWRyaXZlLnJ1IiwiZG9tYWluOnlhbmRleC1kcml2ZS5ydSIsImRvbWFpbjphbnl0aW1lY2Fyc2hhcmluZy5ydSIsImRvbWFpbjp5b3Vkcml2ZS50b2RheSIsImRvbWFpbjpyZW50bWVlLmNsdWIiLCJkb21haW46bGlmY2FyLnJ1IiwiZG9tYWluOmNhcnM3LnJ1IiwicmVnZXhwOi4qXFwucnUkIiwicmVnZXhwOi4qXFwuc3UkIiwicmVnZXhwOi4qXFwueG4tLXAxYWkkIl0sIkJsb2NrU2l0ZXMiOltdLCJEaXJlY3RJcCI6WyJnZW9pcDpwcml2YXRlIiwiZ2VvaXA6cnUiLCIxMjcuMC4wLjAvOCIsIjEwLjAuMC4wLzgiLCIxNzIuMTYuMC4wLzEyIiwiMTkyLjE2OC4wLjAvMTYiXSwiUHJveHlJcCI6WyJnZW9pcDp0ZWxlZ3JhbSIsIjkxLjEwOC40LjAvMjIiLCI5MS4xMDguOC4wLzIyIiwiOTEuMTA4LjEyLjAvMjIiLCI5MS4xMDguMTYuMC8yMiIsIjkxLjEwOC41Ni4wLzIyIiwiMTQ5LjE1NC4xNjAuMC8yMCJdLCJCbG9ja0lwIjpbXSwiQ3VzdG9tUnVsZXMiOltdLCJMYXN0VXBkYXRlZCI6MTc3OTk3MjA4OSwiR2xvYmFsUHJveHkiOnRydWV9
