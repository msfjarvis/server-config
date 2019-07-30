#!/bin/bash

CL_RST="\033[0m"
CL_YLW="\033[01;33m"

function prettyPrint {
    echo -e "${CL_YLW}${1}${CL_RST}"
}

# Grab all service names
declare -a services=('caddy' 'gitea' 'horbiswalls-bot' 'mirror-bot' 'uno-bot')

# Now loop through each service and install it
for service in "${services[@]}"; do
    if [ "${1}" ] && [ "${service}" != "${1}" ]; then
        continue
    fi
    prettyPrint "Installing ${service}"
    sudo cp -v "${service}.service" /etc/systemd/system/
    sudo systemctl daemon-reload
    prettyPrint "Restarting ${service}"
    sudo service "${service}" restart
    if [ ! -f "/etc/systemd/system/multi-user.target.wants/${service}.service" ]; then
        prettyPrint "Enabling ${service}"
        sudo systemctl enable "${service}"
    fi
done
