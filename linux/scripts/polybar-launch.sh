#!/bin/sh
killall polybar
polybar top -c ~/.config/polybar/config &
polybar bottom -c ~/.config/polybar/config &