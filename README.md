## server-config

Configuration files for various parts of my webserver

### Files

- [Caddyfile](Caddyfile): Configuration file for [caddyserver](https://caddyserver.com) instance that powers everything on my webserver.
- [systemd-units](systemd_units): Systemd units for various custom services I have on the webserver.
  - [caddy.service](systemd_units/caddy.service): Unit for the caddyserver instance that powers everything.
  - [daas.service](systemd_units/daas.service): Unit for [daas](https://daas.msfjarvis.website), my demangler web service.
  - [gitea.service](systemd_units/gitea.service): Gitea systemd unit for [git.msfjarvis.website](https://git.msfjarvis.website).
  - [mirror-bot.service](systemd_units/mirror-bot.service), [mirror-bot-2.service](systemd_units/mirror-bot-2.service): Systemd units for my copies of [aria-telegram-mirror-bot](https://github.com/out386/aria-telegram-mirror-bot).
  - [mkr-bin.service](systemd_units/mkr-bin.service): Unit for my `mkr/bin` pastebin [instance](https://bin.msfjarvis.website).
  - [pyrobud.service](systemd_units/pyrobud.service): Unit for my [pyrobud](https://github.com/kdrag0n/pyrobud) instance.
  - [uno-bot.service](systemd_units/uno-bot.service): Unit for the [UNO telegram bot](https://github.com/msfjarvis/mau_mau_bot) I host.
  - [walls-bot.service](systemd_units/walls-bot.service): Units for the [walls-bot](https://github.com/msfjarvis/walls-bot) instances I run for my desktop walls collections.
