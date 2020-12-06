#!/bin/sh
while [ ! -f "$HOME/.screenlayout/default.sh" ]
do
    echo "Configure your default screen layout then save it to '$HOME/.screenlayout/default.sh'"
    read -p "Press [Enter] key to open arandr..."
    arandr
    read -p "Press [Enter] when you have exported your layout to '$HOME/.screenlayout/default.sh'"
done