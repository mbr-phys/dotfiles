#!/bin/sh

#taken from polybar-scripts repo on gh

if [ "$(pgrep openvpn)" ]; then
    echo "active"
else
    echo "inactive"
fi
