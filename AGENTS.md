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

**При любом изменении списка DIRECT/PROXY нужно обновить все четыре файла:**

1. `configs/happ/neplach-routing.json` — поле `DirectSites` или `ProxySites`
2. `configs/karing/diversion_rules_custom.json` — соответствующий блок `rules`
3. `configs/shadowrocket/neplach-routing.conf` — соответствующая секция `[Rule]`
4. `README.md` — таблица в разделе «3. Routing-конфиги» (если исключение из правила)

`happ-routing.html` менять не нужно — страница динамически грузит JSON из `configs/happ/`.

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
