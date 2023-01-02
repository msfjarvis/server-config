#!/usr/bin/env bash

set -euo pipefail

function update_paper() {
  local CURRENT_VERSION LATEST_VERSION
  CURRENT_VERSION="$(cat .paper-version)"
  LATEST_VERSION="$(curl -s 'https://papermc.io/api/v2/projects/paper/versions/1.19.3' -H 'accept: application/json' | jq .builds[-1])"
  echo "Currently running version is ${CURRENT_VERSION}"
  echo "Latest version is 1.19.3-${LATEST_VERSION}"
  [ -f "paper-1.19.3-${LATEST_VERSION}.jar" ] && return
  echo "Updating to 1.19.3-${LATEST_VERSION}"
  curl --progress-bar -L "https://papermc.io/api/v2/projects/paper/versions/1.19.3/builds/${LATEST_VERSION}/downloads/paper-1.19.3-${LATEST_VERSION}.jar" -o "paper-1.19.3-${LATEST_VERSION}.jar"
  echo "1.19.3-${LATEST_VERSION}" >.paper-version
}

function cleanup_previous_jars() {
  find . -maxdepth 1 -type f -name 'paper-*.jar' | sort -r | tail -n +3 | xargs rm -v
}

update_paper
cleanup_previous_jars
