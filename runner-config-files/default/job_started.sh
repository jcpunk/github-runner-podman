#!/bin/bash

if [[ ! -e /usr/bin/podman ]]; then
    sudo apt-get update
    sudo apt-get install -y podman
fi
