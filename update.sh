#!/usr/bin/env bash

CADDYFILE_DEST=/etc/caddy/Caddyfile

sudo cp "${CADDYFILE_DEST}" "${CADDYFILE_DEST}.old"
sudo cp Caddyfile /etc/caddy/Caddyfile
