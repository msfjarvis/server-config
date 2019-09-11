#!/usr/bin/env bash

CADDYFILE_DEST := /etc/caddy/Caddyfile
SERVICES := "caddy gitea mirror-bot mirror-bot-2 uno-bot walls-bot walls-bot-2"

caddy:
	@cp -v $(CADDYFILE_DEST) $(CADDYFILE_DEST).old
	@cp -v Caddyfile $(CADDYFILE_DEST)

caddyinstall: caddy
	systemctl restart caddy

.DEFAULT_GOAL := caddyinstall
