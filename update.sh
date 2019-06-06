#!/bin/bash

CL_RST="\033[0m"
CL_YLW="\033[01;33m"

function prettyPrint {
    echo -e "${CL_YLW}${1}${CL_RST}"
}

# Grab all service names
declare -a services=('caddy' 'horbiswalls-bot' 'mirror-bot' 'uno-bot')

# Place the systemd unit files where they belong
prettyPrint "Copying systemd files to /etc/systemd/system"
for service in "${services[@]}"; do sudo cp -v "${service}.service" /etc/systemd/system/; done

# Reload systemctl so that it processes our changes
prettyPrint "Reloading systemctl daemon"
sudo systemctl daemon-reload

# Now loop through each service and restart it
for service in "${services[@]}"; do
    prettyPrint "Restarting ${service}"
    sudo service "${service}" restart
    if [ ! -f "/etc/systemd/system/multi-user.target.wants/${service}.service" ]; then
        prettyPrint "Enabling ${service}"
        sudo systemctl enable "${service}"
    fi
done
