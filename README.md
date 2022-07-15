## server-config

Configuration files for various parts of my webserver

### Files

- [caddy](caddy): Caddy configurations for the sites I self-host.
- [systemd-units](systemd_units): Systemd units for various custom services I have on the webserver.
  - [mirror-bot.service](systemd_units/mirror-bot.service): Systemd unit for [aria-telegram-mirror-bot](https://github.com/out386/aria-telegram-mirror-bot).
  - [uno-bot.service](systemd_units/uno-bot.service): Service unit for the [mau_mau_bot](https://github.com/msfjarvis/mau_mau_bot) instance I run to play UNO with friends.
- [topgrade.toml](topgrade.toml): Config file for [topgrade](https://github.com/r-darwish/topgrade).
