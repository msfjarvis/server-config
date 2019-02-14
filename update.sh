#!/bin/bash

CL_RST="\033[0m"
CL_YLW="\033[01;33m"

function reportWarning {
    echo -e ""
    echo -e "${CL_YLW}${1}${CL_RST}"
    if [[ -z "${2}" ]]; then
        echo -e ""
    fi
}

# Grab all service names
declare -a services
while IFS=  read -r -d $'\0'; do
    services+=("$REPLY")
done < <(find . -name '*.service' -print0 | sed 's/\.\///g')

# Place the systemd unit files where they belong
reportWarning "Copying systemd files to /etc/systemd/system"
for service in "${services[@]}"; do cp "${service}" /etc/systemd/system/; done

# Reload systemctl so that it processes our changes
reportWarning "Reloading systemctl daemon"
sudo systemctl daemon-reload

# Now loop through each service and restart it
for service in "${services[@]}"; do
    reportWarning "Restarting ${service}"
    service "${service}" restart
    [ -f "/etc/systemd/system/${service}.service" ] || systemctl enable "${service}"
done