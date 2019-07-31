#!/bin/bash

CL_RST="\033[0m"
CL_YLW="\033[01;33m"

function prettyPrint {
    echo -e "${CL_YLW}${1}${CL_RST}"
}

# Grab all service names
declare -a services=('androidx-release-watcher' 'caddy' 'gitea' 'horbiswalls-bot' 'mirror-bot' 'uno-bot')
declare -a timers=('release-watcher-recent')

# Now loop through each service and install it
for service in "${services[@]}"; do
    if [ "${1}" ] && [ "${service}" != "${1}" ]; then
        continue
    fi
    prettyPrint "Installing ${service}"
    sudo cp -v "${service}.service" /etc/systemd/system/
    sudo systemctl daemon-reload
    prettyPrint "Restarting ${service}"
    sudo systemctl restart "${service}"
    if [ ! -f "/etc/systemd/system/multi-user.target.wants/${service}.service" ]; then
        prettyPrint "Enabling ${service}"
        sudo systemctl enable "${service}"
    fi
done

for timer in "${timers[@]}"; do
    if [ "${1}" ] && [ "${timer}" != "${1}" ]; then
        continue
    fi
    prettyPrint "Installing ${timer}"
    sudo cp -v "${timer}.timer" /etc/systemd/system/
    sudo systemctl daemon-reload
    prettyPrint "Restarting ${timer}"
    sudo systemctl restart "${timer}".timer
    if [ ! -f "/etc/systemd/system/multi-user.target.wants/${timer}.timer" ]; then
        prettyPrint "Enabling ${timer}"
        sudo systemctl enable "${timer}".timer
    fi
done
