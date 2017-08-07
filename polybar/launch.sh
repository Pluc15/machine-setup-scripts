#!/bin/sh

killall polybar
polybar top -c ~/.dotfiles/polybar/config &
polybar bottom -c ~/.dotfiles/polybar/config &