#!/bin/bash

# Check if running as root (for system-wide install)
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root."
    exit 1
fi

# Define install directory
INSTALL_DIR="$HOME/.local/share/plasma/plasmoids/time_and_date_applet"

# Install applet files
mkdir -p "$INSTALL_DIR"
cp -r * "$INSTALL_DIR"

# Install the applet using plasmapkg
plasmapkg2 --install "$INSTALL_DIR"

# Inform the user
echo "Applet installed successfully."
echo "You can now add 'Time and Date on Wallpaper' from the Plasma widget menu."
