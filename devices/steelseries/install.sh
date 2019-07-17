#!/bin/sh
sudo cp "$DOTFILES/devices/steelseries/steelseries-arctis-input.conf" "/usr/share/pulseaudio/alsa-mixer/paths/steelseries-arctis-input.conf"
sudo cp "$DOTFILES/devices/steelseries/steelseries-arctis-output-mono.conf" "/usr/share/pulseaudio/alsa-mixer/paths/steelseries-arctis-output-mono.conf"
sudo cp "$DOTFILES/devices/steelseries/steelseries-arctis-output-stereo.conf" "/usr/share/pulseaudio/alsa-mixer/paths/steelseries-arctis-output-stereo.conf"
sudo cp "$DOTFILES/devices/steelseries/steelseries-arctis-usb-audio.conf" "/usr/share/pulseaudio/alsa-mixer/profile-sets/steelseries-arctis-usb-audio.conf"