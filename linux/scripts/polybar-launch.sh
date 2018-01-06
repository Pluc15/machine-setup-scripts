#!/bin/sh
killall polybar
MONITOR=eDP-1 polybar top -c ~/.config/polybar/config &
MONITOR=eDP-1 polybar bottom -c ~/.config/polybar/config &

MONITOR=DP-1 polybar top -c ~/.config/polybar/config &
MONITOR=DP-1 polybar bottom -c ~/.config/polybar/config &

MONITOR=HDMI-2 polybar top -c ~/.config/polybar/config &
MONITOR=HDMI-2 polybar bottom -c ~/.config/polybar/config &