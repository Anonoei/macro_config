#!/bin/bash
# Copyright (C) 2025 Anonoei <dev@anonoei.com>
#
# This file may be distributed under the terms of the MIT license.

# Force script to exit if an error occurs
set -e

SYSTEMDDIR="/etc/systemd/system"
SRCDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/ && pwd )"

# Verify we're running as root
if [ "$(id -u)" -eq 0 ]; then
    echo "This script must not run as root"
    exit -1
fi

# Check if Klipper is installed
if [ "$(sudo systemctl list-units --full -all -t service --no-legend | grep -F "klipper.service")" ]; then
    echo "Klipper service found!"
else
    echo "Klipper service not found, please install Klipper first"
    exit -1
fi

# Copy user settings
cp "${SRCDIR}/_examples/settings.cfg" "../macro_config.cfg"

# Restart klipper
echo "Restarting Klipper..."
sudo systemctl restart klipper
