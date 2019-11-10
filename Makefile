#!/usr/bin/env bash

CADDYFILE_DEST := /etc/caddy/Caddyfile

caddy:
	@cp -v $(CADDYFILE_DEST) $(CADDYFILE_DEST).old
	@cp -v Caddyfile $(CADDYFILE_DEST)

caddyinstall: caddy
	systemctl restart caddy

.DEFAULT_GOAL := caddyinstall
