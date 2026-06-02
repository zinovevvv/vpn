# Инструкция для агентов

## Структура репозитория

```
configs/
  happ/neplach-routing.json          — основной конфиг (HAPP)
  karing/diversion_rules_custom.json — конфиг для Karing
  shadowrocket/neplach-routing.conf  — конфиг для Shadowrocket
happ-routing.html                    — веб-страница для установки роутинга одной кнопкой
README.md                            — публичная инструкция для пользователей
```

## Логика роутинга

- **DIRECT** — российские IP (`geoip:ru`), домены `.ru` / `.su` / `.рф`, российские сервисы с иностранными доменами (VK, Яндекс, Сбер и т.д.), локальные сети, а также иностранные сервисы из списка исключений ниже.
- **PROXY** — всё остальное по умолчанию, плюс явно заблокированные в РФ сервисы (Telegram, Instagram, YouTube, X и т.д.).

### Иностранные сервисы, которые идут напрямую (исключения)

| Сервис | Домен | Причина |
| --- | --- | --- |
| AnyDesk | `anydesk.com` | удалённый доступ, VPN ломает relay |

## Правило синхронизации

**При любом изменении списка DIRECT/PROXY нужно обновить все пять файлов:**

1. `configs/happ/neplach-routing.json` — поле `DirectSites` или `ProxySites`
2. `configs/karing/diversion_rules_custom.json` — соответствующий блок `rules`
3. `configs/shadowrocket/neplach-routing.conf` — соответствующая секция `[Rule]`
4. `configs/hiddify/neplach-routing.json` — нужное правило в `route.rules[]` (конфиг хранится для будущих версий Hiddify)
5. `README.md` — таблица в разделе «3. Routing-конфиги» (если исключение из правила)

`happ-routing.html` менять не нужно — страница динамически грузит JSON из `configs/happ/`.

## Hiddify — исследование ограничений (v4.0.0 dev)

Hiddify убран из рекомендуемых клиентов, так как кастомный роутинг
в версии 4.0.0 dev не поддерживается ни одним из проверенных способов.

### Что не работает и почему

| Способ | Ошибка | Причина |
| --- | --- | --- |
| `hiddify://import/data:application/json;base64,...` | «Непредвиденная ошибка подключения» | data: URI не поддерживается как URL для скачивания |
| `hiddify://import/https://<hosted-url>` | `SocketException: Connection refused (127.0.0.1)` | Hiddify скачивает профиль через свой локальный sing-box прокси; если VPN не запущен — прокси не слушает |
| Настройки → Маршрутизация → + → Из файла | опция не существует | В Hiddify 4.0.0 раздел «Маршрутизация» содержит только переключатели (регион, блокировка рекламы, LAN) — импорта файлов нет |
| `+` → Импортировать из файла | опция не существует | Кнопка `+` открывает только QR / Буфер обмена / Вручную — файлового импорта нет |
| Полный sing-box профиль с `outbound_providers` + `outbounds` | `panic: index out of range [0] with length 0` в `setOutbounds/builder.go:292` | `outbound_providers` загружаются асинхронно; в момент `BuildConfig` список серверов пуст, обращение к `outbounds[0]` — паника |
| Routing-only JSON (только `route`) через `hiddify://import/` | `[SingboxParser] unmarshal error: EOF` | Hiddify скачивает файл, SingboxParser не может разобрать конфиг без секции `outbounds` |

### Что есть в Hiddify 4.0.0 для российских пользователей

Настройки → Маршрутизация → **Регион: Россия (ru)** — встроенный bypass
на основе `geoip:ru`. Покрывает российские IP и большинство .ru-доменов,
но не учитывает специфичные домены из нашего списка (vk.com, yandex.net,
nch-spb.com и т.д.).

## Формат записей

### happ (JSON)
```json
"domain:anydesk.com"      // в DirectSites / ProxySites
```

### Karing (JSON)
```json
"domain_suffix": ["anydesk.com"]   // в нужном правиле rules[]
```

### Shadowrocket (conf)
```
DOMAIN-SUFFIX,anydesk.com,DIRECT   // или PROXY
```
