# Другие клиенты

[← Назад](README.md)

## Shadowrocket · iOS

[Скачать в App Store](https://apps.apple.com/us/app/shadowrocket/id932747118)

**Добавить routing:**

1. Скопируй ссылку на конфиг:
   ```
   https://raw.githubusercontent.com/zinovevvv/vpn/main/configs/shadowrocket/neplach-routing.conf
   ```
2. Shadowrocket → `Config` → `+` → `Download from URL` → вставь ссылку.
3. Нажми на конфиг и выбери **Use config**.

---

<a id="karing-macos"></a>

## Karing · macOS и Android

[Скачать для macOS](https://karing.app/download) · [GitHub Releases](https://github.com/KaringX/karing/releases) · [Google Play](https://play.google.com/store/apps/details?id=com.nebula.karing)

Официально поддерживается macOS 12 и новее. Сначала установи приложение и добавь подписку: **Settings → Add Configuration** → вставь ссылку подписки. Для роутинга есть также [короткая веб-инструкция](https://zinovevvv.github.io/vpn/#karing-setup).

**Импортировать правила проекта:**

1. [Скачай JSON с правилами Karing](https://raw.githubusercontent.com/zinovevvv/vpn/main/configs/karing/diversion_rules_custom.json).
2. В приложении открой **Settings → Diversion → Diversion rules → Edit → Custom diversion group**.
3. Открой меню `…` → **Import**, выбери скачанный `diversion_rules_custom.json` и подтверди импорт.
4. Вернувшись в **Diversion rules**, проверь, что группы включены и их действия назначены как в конфиге.
5. На главном экране выбери **Rule**, подключись или переподключись к профилю.

Не добавляй весь файл `diversion_rules_custom.json` как отдельный remote rule set: это файл импорта пользовательских групп. Внутри таких групп Karing поддерживает отдельные remote rule sets. В файле есть platform-specific правила с Android package ID и Windows process name; на Mac используй доменные и IP-правила.

Инструкция Karing: [импорт и настройка custom diversion](https://karing.app/en/tutorial/custom-diversion), [редактор правил](https://karing.app/en/app-manual/diversion-rule-edit).

---

## Hiddify · iOS / Android / Windows / macOS

[iOS](https://apps.apple.com/us/app/hiddify-proxy-vpn/id6596777532) · [Android](https://play.google.com/store/apps/details?id=app.hiddify.com) · [Windows / macOS](https://github.com/hiddify/hiddify-app)

> **Важно:** кастомный routing-конфиг в Hiddify 4.x не поддерживается ни через импорт, ни через UI. В качестве частичной замены: Настройки → Маршрутизация → Регион: **Россия (ru)** — встроенный bypass на основе `geoip:ru`.
