#!/bin/bash

if [[ ! -e /usr/bin/podman ]]; then
    echo "Installing podman"
    echo | sudo -S apt-get update
    echo | sudo -S apt-get install -y podman
fi

if [[ ! -e ~/.config/containers/containers.conf ]]; then
    echo "Configuring podman"
    mkdir -p ~/.config/containers
    cat <<EOF >~/.config/containers/containers.conf
[engine]
  remote = true
  active_service = "docker"
  [engine.service_destinations]
    [engine.service_destinations.docker]
      uri = "unix:///run/docker.sock"
EOF
fi
