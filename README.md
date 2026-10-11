# Neplach VPN

## Приложение

| Платформа | Ссылка |
| --- | --- |
| iOS / iPadOS | [App Store Global](https://apps.apple.com/us/app/happ-proxy-utility/id6504287215) · [App Store RU](https://apps.apple.com/ru/app/happ-proxy-utility-plus/id6746188973) |
| Android | [Google Play](https://play.google.com/store/apps/details?id=com.happproxy) · [APK](https://github.com/Happ-proxy/happ-android/releases/latest/download/Happ.apk) |
| Windows | [Скачать](https://github.com/Happ-proxy/happ-desktop/releases/latest/download/setup-Happ.x64.exe) |
| macOS | [Скачать](https://github.com/Happ-proxy/happ-desktop/releases/latest/download/Happ.macOS.universal.dmg) |

## Подключение

Подписку выдаёт администратор.

1. Скопируй ссылку-подписку в буфер обмена.
2. HAPP → `+` → добавь подписку из буфера, по QR-коду или deeplink.
3. Разреши подключение, если система попросит.
4. Выбери профиль — нормальный пинг до 100 мс.

## Маршрутизация

Российские домены и IP — напрямую, остальное — через прокси.
Для Ozon правила DIRECT охватывают корневые домены **и все их поддомены**, включая API, картинки и видео приложения.

| Назначение | Домены DIRECT |
| --- | --- |
| Сайт, API, авторизация | `ozon.ru`, `ozon.com`, `ozone.ru` |
| Ресурсы и дополнительные окружения | `ozonusercontent.com`, `ozoncdn.com`, `ozonru.me` |
| Региональные сайты | `ozon.by`, `ozon.kz`, `ozon.com.by`, `ozon.com.kz`, `ozon.uz`, `ozon.tm` |
| Global / Travel | `ozon.global`, `ozon.travel` |
| Другие сервисы Ozon | `o3.ru`, `o3t.ru`, `o3team.ru`, `ozon-dostavka.ru` |

Сбер и СберТех направляются напрямую, включая официальные домены СберТеха: `sbertech.ru`, `getsynapse.io`, `pmplatform.ru`, `datatracker.pro` (вместе с поддоменами).

Ранее добавленное исключение `ngenix.net` также сохранено; это общий CDN, не только Ozon.
[Исследование Ozon и проверка мобильного приложения через Mac](docs/ozon-routing.md).

Для Avito явно добавлены `avito.ru` и `avito.st`; для Циан — `cian.ru`, включая API на `public-api.cian.ru` и остальные поддомены. `citydrive.ru` охватывает сайт и поддомены Ситидрайва; API `api.citydrive.ru` указан явно. `city-mobil.ru` добавлен как связанный домен экосистемы Ситидрайв/Ситимобил.
Для BelkaCar явно добавлены API и зависимости приложения: `mapi.belkacar.ru`, `sentry.belkacar.ru`, `api.cyberity.ru`, `support.cyberity.ru`, `mapbox.com`, `appmetrica.io`, `appsflyersdk.com`, `pushwoosh.com`, `belkacar-1322.firebaseio.com`, `belkacar-1322.appspot.com`, Firebase Remote Config/Installations и `app-measurement.com`.

**[→ Добавить routing в HAPP](https://raw.githack.com/zinovevvv/vpn/main/happ-routing.html?v=261011)**

В HAPP Desktop 4.0.5+ роутинг настраивается отдельно для каждой подписки:

1. Добавь профиль кнопкой выше. Если macOS открывает старую версию HAPP, [скачай импорт для Happ Desktop](https://github.com/zinovevvv/vpn/raw/refs/heads/main/happ-routing-2610-services.command?download=1) и запусти его — он адресно открывает ссылку в `/Applications/Happ Desktop.app`.
2. На главном экране нажми `…` у обычной подписки → **Routing**.
3. Включи **Enable Routing**.
4. В **Connected Profiles** выбери **Neplach routing 2610-services**.
5. Оставь **Ignore Routing Import** выключенным, дождись загрузки geofiles и переподключи VPN.

JSON-подписка с готовой конфигурацией может не поддерживать отдельный HAPP-роутинг; в этом случае назначай профиль обычной подписке. После изменения маршрутов перезапусти нужное приложение.

В старых версиях HAPP: **Settings → Routing Rules → Use routing**.

---

Другие клиенты (Shadowrocket, Karing, Hiddify) — [CLIENTS.md](CLIENTS.md)

*Используй в соответствии с законодательством страны пребывания. Репозиторий содержит технические правила маршрутизации сети и не предоставляет серверы или подписки.*
