#!/bin/sh
ln -fs "$DOTFILES/devices/steelseries/steelseries-arctis-input.conf" "/usr/share/pulseaudio/alsa-mixer/paths/steelseries-arctis-input.conf"
ln -fs "$DOTFILES/devices/steelseries/steelseries-arctis-output-mono.conf" "/usr/share/pulseaudio/alsa-mixer/paths/steelseries-arctis-output-mono.conf"
ln -fs "$DOTFILES/devices/steelseries/steelseries-arctis-output-stereo.conf" "/usr/share/pulseaudio/alsa-mixer/paths/steelseries-arctis-output-stereo.conf"
ln -fs "$DOTFILES/devices/steelseries/steelseries-arctis-usb-audio.conf" "/usr/share/pulseaudio/alsa-mixer/profile-sets/steelseries-arctis-usb-audio.conf"