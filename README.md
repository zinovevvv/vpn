# Neplach VPN

**[Открыть страницу подключения и выбора приложения](https://zinovevvv.github.io/vpn/)** · [HAPP](#роутинг-в-happ) · [Karing для Mac](#karing-для-macos)

Подписку выдаёт администратор. Выбери приложение и следуй инструкции для своей платформы.

| Нужно | Раздел |
| --- | --- |
| Быстро подключиться в HAPP | [Установка и подключение](#подключение) |
| Настроить сайты DIRECT / PROXY в HAPP | [Роутинг в HAPP](#роутинг-в-happ) |
| Использовать Karing на Mac с отдельными правилами | [Karing для macOS](#karing-для-macos) · [полная инструкция](CLIENTS.md#karing-macos) |
| Посмотреть все поддерживаемые клиенты | [Другие клиенты](CLIENTS.md) |

## Приложения

| Платформа | Ссылка |
| --- | --- |
| iOS / iPadOS | [App Store Global](https://apps.apple.com/us/app/happ-proxy-utility/id6504287215) · [App Store RU](https://apps.apple.com/ru/app/happ-proxy-utility-plus/id6746188973) |
| Android | [Google Play](https://play.google.com/store/apps/details?id=com.happproxy) · [APK](https://github.com/Happ-proxy/happ-android/releases/latest/download/Happ.apk) |
| Windows | [Скачать](https://github.com/Happ-proxy/happ-desktop/releases/latest/download/setup-Happ.x64.exe) |
| macOS | [Скачать](https://github.com/Happ-proxy/happ-desktop/releases/latest/download/Happ.macOS.universal.dmg) |

**Второй вариант для macOS — [Karing](https://karing.app/download).** Он поддерживает собственные правила маршрутизации. Для установки подписки и импорта правил см. [инструкцию Karing для Mac](CLIENTS.md#karing-macos). Karing — отдельное приложение: HAPP-профиль роутинга в него импортировать не нужно.

## Подключение

1. Скопируй ссылку-подписку в буфер обмена.
2. HAPP → `+` → добавь подписку из буфера, по QR-коду или deeplink.
3. Разреши подключение, если система попросит.
4. Выбери профиль — нормальный пинг до 100 мс.

Для Karing: добавь ссылку как новую конфигурацию через **Add Configuration** и подключись к выбранному узлу. Далее импортируй правила по инструкции ниже.

## Роутинг в HAPP

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

1. Открой страницу выше. На Mac скопируй профиль и в Happ Desktop выбери **Settings → Routing Rules → ⋯ → Import Profile from Clipboard**, затем назначь его обычной подписке. Если буфер обмена браузера недоступен, [скачай helper для Happ Desktop](https://github.com/zinovevvv/vpn/raw/refs/heads/main/happ-routing-2610-services.command?download=1): он скопирует ссылку и откроет `/Applications/Happ Desktop.app`.
2. На главном экране нажми `…` у обычной подписки → **Routing**.
3. Включи **Enable Routing**.
4. В **Connected Profiles** выбери **Neplach routing 2610-services**.
5. Оставь **Ignore Routing Import** выключенным, дождись загрузки geofiles и переподключи VPN.

JSON-подписка с готовой конфигурацией может не поддерживать отдельный HAPP-роутинг; в этом случае назначай профиль обычной подписке. После изменения маршрутов перезапусти нужное приложение.

В старых версиях HAPP: **Settings → Routing Rules → Use routing**.

## Karing для macOS

Karing — отдельный VPN-клиент для Mac (macOS 12+). Скачай его с [официального сайта](https://karing.app/download), добавь подписку администратора и импортируй существующий файл правил [Karing JSON](https://raw.githubusercontent.com/zinovevvv/vpn/main/configs/karing/diversion_rules_custom.json).

1. Скачай JSON-файл правил по ссылке выше.
2. В Karing открой **Settings → Diversion → Diversion rules → Edit → Custom diversion group**.
3. Открой меню `…` и выбери **Import**, затем укажи скачанный `diversion_rules_custom.json`.
4. Подтверди импорт кнопкой сохранения. Вернись в **Diversion rules** и проверь, что импортированные группы включены с назначенными действиями `direct`, `currentSelected` и `proxy`.
5. На главном экране выбери режим **Rule** (не **Global**), подключи профиль и переподключись после изменения правил.

В режиме **Rule** доменные и IP-правила из файла направляют российские сервисы напрямую, перечисленные сервисы — через выбранный VPN-узел, а остальной трафик следует режиму и правилам конфигурации. Некоторые правила с Android package ID или Windows process name предназначены для этих платформ; на Mac применяются совпадающие доменные и IP-правила. Не импортируй HAPP JSON в Karing. Совместимость самой VPN-подписки с Karing зависит от её формата.

Правила Karing поддерживаются отдельно от HAPP и хранятся в [`configs/karing/diversion_rules_custom.json`](configs/karing/diversion_rules_custom.json). При изменении списка доменов обновляй клиентские форматы согласно [AGENTS.md](AGENTS.md).

---

Другие клиенты (Shadowrocket, Hiddify) — [CLIENTS.md](CLIENTS.md)

*Используй в соответствии с законодательством страны пребывания. Репозиторий содержит технические правила маршрутизации сети и не предоставляет серверы или подписки.*
