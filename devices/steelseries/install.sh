#!/bin/sh
sudo cp "$DOTFILES/devices/steelseries/90-pulseaudio-steelseries-arctis.rules" "/lib/udev/rules.d/"
sudo cp "$DOTFILES/devices/steelseries/steelseries-arctis-input.conf" "/usr/share/pulseaudio/alsa-mixer/paths/"
sudo cp "$DOTFILES/devices/steelseries/steelseries-arctis-output-mono.conf" "/usr/share/pulseaudio/alsa-mixer/paths/"
sudo cp "$DOTFILES/devices/steelseries/steelseries-arctis-output-stereo.conf" "/usr/share/pulseaudio/alsa-mixer/paths/"
sudo cp "$DOTFILES/devices/steelseries/steelseries-arctis-usb-audio.conf" "/usr/share/pulseaudio/alsa-mixer/profile-sets/"