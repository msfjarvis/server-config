## server-config

Configuration files for various parts of my webserver

### Files

- [Caddyfile](Caddyfile): Configuration file for [caddyserver](https://caddyserver.com) instance that powers everything on my webserver.
- [systemd-units](systemd_units): Systemd units for various custom services I have on the webserver.
  - [caddy.service](systemd_units/caddy.service): Unit for the caddyserver instance that powers everything.
  - [mirror-bot.service](systemd_units/mirror-bot.service), [mirror-bot-2.service](systemd_units/mirror-bot-2.service): Systemd units for my copies of [aria-telegram-mirror-bot](https://github.com/out386/aria-telegram-mirror-bot).
  - [uno-bot.service](systemd_units/uno-bot.service): Service unit for the [mau_mau_bot](https://github.com/msfjarvis/mau_mau_bot) instance I run to play UNO with friends.
  - [walls-bot.service](systemd_units/walls-bot.service): Unit for the [walls-bot](https://github.com/msfjarvis/walls-bot) instance I run for my desktop walls collections.
  - [walls-bot-rs.service](systemd_units/walls-bot-rs.service): Unit for the work-in-progress walls-bot rewrite [walls-bot-rs](https://github.com/msfjarvis/walls-bot-rs).
