#!/bin/sh
sudo pacman-key --refresh-keys
sudo pacman -Sy archlinux-keyring && sudo pacman -Su