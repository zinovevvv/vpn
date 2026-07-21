# Changelog

## 2026-07-18 — HAPP macOS: Routing Rules не применялись к трафику

**Статус:** решено. В HAPP 5.1 роутинг перенесён на уровень подписки;
импортированный профиль нужно отдельно подключить к нужной подписке.

Изначально на macOS-клиенте HAPP выбранный routing-профиль не влиял на
реальную маршрутизацию трафика — весь трафик, включая домены из
`DirectSites`, уходил через proxy-outbound.

### Диагностика (локально, на реальном подключении)

- `tunnel.log` при каждом старте туннеля:
  ```
  config data is not found or does not exist
  cant find json config data
  ```
- Реально применённый конфиг Xray (`connectedConfigJson` в
  `~/Library/Group Containers/group.su.ffg.happ/Library/Preferences/group.su.ffg.happ.plist`)
  содержит только одно правило маршрутизации:
  ```json
  "routing": {
    "domainStrategy": "AsIs",
    "rules": [{ "inboundTag": ["socks-direct"], "outboundTag": "direct" }]
  }
  ```
  Правил из `DirectSites`/`DirectIp`/`ProxySites`/`ProxyIp` там нет.
- `access.log` подтверждает: vk.com, yandex.ru идут `[socks-in >> proxy]`
  вместо direct.
- Замер latency (en0 напрямую vs через tun) показывает разницу
  (~60–150мс direct против ~340–490мс через VPN), то есть direct-домены
  реально проксируются, а не просто "выглядят" так в логе.
- На macOS нет отдельного тумблера "Use routing" для профиля (в отличие
  от iOS/Android) — на десктопе доступен только выбор профиля в списке.

### Проверка на других профилях

Переключение с собственного профиля (`configs/happ/neplach-routing.json`)
на профиль, рекомендованный самими разработчиками HAPP —
[hydraponique/roscomvpn-happ-routing](https://github.com/hydraponique/roscomvpn-happ-routing) —
не решило проблему: `routing.rules` в применённом конфиге остаётся той же
заглушкой независимо от источника профиля. Это подтверждает, что причина
не в конкретном JSON, а в приложении (вероятно, в локальном состоянии
после миграции профилей v2 → v3, зафиксированной в логе как
`migration: starting v2 -> v3 migration of 4 profile(s)`).

### Причина и решение

- В HAPP 5.1 появился новый механизм: роутинг включается и выбирается
  отдельно для каждой подписки.
- После импорта профиля нужно открыть `…` у подписки → `Routing`, включить
  `Enable Routing` и выбрать профиль в разделе `Connected Profiles`.
- `Ignore Routing Import` должен оставаться выключенным, иначе приложение
  игнорирует роутинг, полученный из подписки.
- Наши конфиги (`configs/happ/...`) менять не потребовалось — проблема была
  не в формате или содержимом профиля.
