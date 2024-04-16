#!/bin/bash

if [[ ! -e /usr/bin/podman ]]; then
    sudo ln -s /usr/bin/docker /usr/bin/podman
fi
