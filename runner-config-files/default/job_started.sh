#!/bin/bash

if [[ ! -e /usr/bin/podman ]]; then
    echo | sudo -S apt-get update
    echo | sudo -S apt-get install -y podman
fi
