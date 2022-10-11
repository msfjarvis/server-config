#!/usr/bin/env bash

set -euxo pipefail

sudo apt install -y php8.1-fpm
sudo systemctl stop php8.1-fpm.service
sudo cp ./www.conf /etc/php/8.1/fpm/pool.d/www.conf
adduser --disabled-password --gecos "" caddy
addgroup web
adduser caddy web
adduser msfjarvis web
sudo systemctl start php8.1-fpm.service
