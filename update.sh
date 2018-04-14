#!/bin/bash

CL_RST="\033[0m"
CL_YLW="\033[01;33m"

function reportWarning {
    echo -e ""
    echo -e ${CL_YLW}"${1}"${CL_RST}
    if [[ -z ${2} ]]; then
        echo -e ""
    fi
}

# Grab all service names
services=$(ls *.service | cut -d '.' -f 1)

# Place the systemd unit files where they belong
reportWarning "Copying systemd files to /etc/systemd/system"
sudo cp *.service /etc/systemd/system/

# Reload systemctl so that it processes our changes
reportWarning "Reloading systemctl daemon"
systemctl daemon-reload

# Sleep for 5 seconds to let systemctl get it's shit together
sleep 5

# Now loop through each service and restart it
for service in ${services};do
    reportWarning "Restarting ${service}"
    service ${service} restart
    [[ -f /etc/systemd/system/${service}.service ]] || systemctl enable ${service}
done