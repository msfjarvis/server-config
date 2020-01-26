## server-config

Configuration files for various parts of my webserver

### Files

- [Caddyfile](Caddyfile): Configuration file for [caddyserver](https://caddyserver.com) instance that powers everything on my webserver.
- [systemd-units](systemd_units): Systemd units for various custom services I have on the webserver.
  - [caddy.service](systemd_units/caddy.service): Unit for the caddyserver instance that powers everything.
  - [mirror-bot.service](systemd_units/mirror-bot.service), [mirror-bot-2.service](systemd_units/mirror-bot-2.service): Systemd units for my copies of [aria-telegram-mirror-bot](https://github.com/out386/aria-telegram-mirror-bot).
  - [mkr-bin.service](systemd_units/mkr-bin.service): Unit for my [`mkr/bin`](https://github.com/msfjarvis/bin) pastebin [instance](https://bin.msfjarvis.dev).
  - [walls-bot.service](systemd_units/walls-bot.service): Units for the [walls-bot](https://github.com/msfjarvis/walls-bot) instances I run for my desktop walls collections.
