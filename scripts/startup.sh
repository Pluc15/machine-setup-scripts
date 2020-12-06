#!/bin/bash
set -e

# Services
dunst &
compton -b &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# Restores
nitrogen --restore &
if [ -f "$HOME/.screenlayout/default.sh" ]; then
  sh $HOME/.screenlayout/default.sh
fi

# Systrays
remmina -i &
nm-applet &
redshift-gtk &
pasystray &
cbatticon &

# Scratch pad apps
discord &
