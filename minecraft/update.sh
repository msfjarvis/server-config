#!/usr/bin/env bash

set -euo pipefail

MINECRAFT_VERSION="1.19.3"

function update_paper() {
  local CURRENT_VERSION LATEST_VERSION
  CURRENT_VERSION="$(cat .paper-version)"
  LATEST_VERSION="$(curl -s "https://papermc.io/api/v2/projects/paper/versions/${MINECRAFT_VERSION}" -H 'accept: application/json' | jq .builds[-1])"
  echo "Currently running version is ${CURRENT_VERSION}"
  echo "Latest version is ${MINECRAFT_VERSION}-${LATEST_VERSION}"
  [ -f "paper-${MINECRAFT_VERSION}-${LATEST_VERSION}.jar" ] && return
  echo "Updating to ${MINECRAFT_VERSION}-${LATEST_VERSION}"
  curl --progress-bar -L "https://papermc.io/api/v2/projects/paper/versions/${MINECRAFT_VERSION}/builds/${LATEST_VERSION}/downloads/paper-${MINECRAFT_VERSION}-${LATEST_VERSION}.jar" -o "paper-${MINECRAFT_VERSION}-${LATEST_VERSION}.jar"
  echo "${MINECRAFT_VERSION}-${LATEST_VERSION}" >.paper-version
}

function cleanup_previous_jars() {
  find . -maxdepth 1 -type f -name 'paper-*.jar' | sort -r | tail -n +3 | xargs rm -vf
}

update_paper
cleanup_previous_jars
