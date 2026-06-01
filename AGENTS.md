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
4. `configs/hiddify/neplach-routing.json` — нужное правило в `route.rules[]`
5. `README.md` — таблица в разделе «3. Routing-конфиги» (если исключение из правила)

`happ-routing.html` менять не нужно — страница динамически грузит JSON из `configs/happ/`.

## Hiddify-специфичная архитектура

Конфиг `configs/hiddify/neplach-routing.json` имеет расширенную структуру:
кроме секции `route` он содержит секцию `outbounds` с группой **`telegram-auto`**.

```json
{
  "outbounds": [
    {
      "type": "urltest",
      "tag": "telegram-auto",
      "outbounds": ["auto", "proxy"],
      "url": "http://www.gstatic.com/generate_204",
      "interval": "3m",
      "tolerance": 50
    }
  ],
  "route": { ... }
}
```

### Как это работает

`telegram-auto` — sing-box `urltest`, который каждые 3 минуты замеряет RTT
через два outbound Hiddify:
- `"auto"` — Hiddify-группа «лучший сервер из всей подписки» (сам по себе urltest по всем серверам)
- `"proxy"` — Hiddify-группа «выбранный вручную сервер»

Telegram-трафик идёт через тот, у которого меньше задержка. Если один
становится недоступен — переключение происходит автоматически в пределах
следующего цикла проверки (≤ 3 мин).

**Теги `"auto"` и `"proxy"` — стандартные для Hiddify.** Они создаются
автоматически при добавлении любой подписки (BlancVPN или другой). Конфиг
не хардкодит серверы — работает через динамические группы.

### Что НЕ надо синхронизировать в Hiddify-конфиге

- Изменение серверов/стран подписки — не требует правки конфига.
- Секция `outbounds` в Hiddify-конфиге обновляется только при изменении
  логики выбора (интервал, tolerance, новые группы).

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
