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

| Сервис | Домен | IP-диапазоны | Причина |
| --- | --- | --- | --- |
| AnyDesk | `anydesk.com` (все субдомены) | `62.96.74.120/29`, `213.61.91.48/29`, `217.110.18.136/29`, `217.110.194.192/29` | удалённый доступ; relay-серверы (~400 IP) коннектятся напрямую по IP без DNS — нужно вайтлистить и домен, и IP-диапазоны |

> AnyDesk не публикует полный список relay IP (в отличие от Telegram). Четыре CIDR выше — официальная инфраструктура AnyDesk GmbH. Если всё ещё отваливается — захватить трафик Wireshark и добавить конкретные IP.

## Правило синхронизации

**При любом изменении списка DIRECT/PROXY нужно обновить все четыре файла и поднять версию:**

1. `configs/happ/neplach-routing.json` — поле `DirectSites` / `ProxySites` / `DirectIp` / `ProxyIp`
2. `configs/karing/diversion_rules_custom.json` — соответствующий блок `rules`
3. `configs/shadowrocket/neplach-routing.conf` — соответствующая секция `[Rule]`
4. `README.md` — таблица в разделе «3. Routing-конфиги» (если исключение из правила)

## Версионирование

Схема: `v1`, `v2`, `v3` — простой инкремент.

**При любом смысловом изменении роутинга поднять версию во всех трёх конфигах:**

| Файл | Где версия |
| --- | --- |
| `happ/neplach-routing.json` | `"Name": "Neplach routing vN"` |
| `karing/diversion_rules_custom.json` | `"_version": "vN"` (top-level, клиент игнорирует) |
| `shadowrocket/neplach-routing.conf` | первая строка `# Shadowrocket RU Direct / Global Proxy vN` |

Версию поднимать синхронно во всех трёх — всегда одинаковый номер.

`happ-routing.html` менять не нужно — страница динамически грузит JSON из `configs/happ/`.

## Формат записей

Если у сервиса есть и домены, и IP — нужно указать оба.

### hApp (JSON)

Домены → `DirectSites` / `ProxySites`:
```json
"domain:example.com"
```
IP-диапазоны → `DirectIp` / `ProxyIp`:
```json
"1.2.3.0/24"
```

### Karing (JSON)

Создать отдельный блок в `rules[]` с обоими полями:
```json
{
  "outbound": "direct",
  "name": "example",
  "switch": true,
  "or": true,
  "domain_suffix": ["example.com"],
  "ip_cidr": ["1.2.3.0/24"]
}
```

### Shadowrocket (conf)

```
DOMAIN-SUFFIX,example.com,DIRECT
IP-CIDR,1.2.3.0/24,DIRECT,no-resolve
```
