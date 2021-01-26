## server-config

Configuration files for various parts of my webserver

### Files

- [nginx](nginx): NGINX configurations for the sites I self-host.
  - [dl.msfjarvis.dev](nginx/dl.msfjarvis.dev): NGINX config for my download host
  - [maven.msfjarvis.dev](nginx/maven.msfjarvis.dev): NGINX config for my Maven repository
- [systemd-units](systemd_units): Systemd units for various custom services I have on the webserver.
  - [mirror-bot.service](systemd_units/mirror-bot.service), [mirror-bot-2.service](systemd_units/mirror-bot-2.service): Systemd units for my copies of [aria-telegram-mirror-bot](https://github.com/out386/aria-telegram-mirror-bot).
  - [uno-bot.service](systemd_units/uno-bot.service): Service unit for the [mau_mau_bot](https://github.com/msfjarvis/mau_mau_bot) instance I run to play UNO with friends.
- [topgrade.toml](topgrade.toml): Config file for [topgrade](https://github.com/r-darwish/topgrade).
