#!/bin/sh

killall polybar
polybar bar1 -c ~/.dotfiles/polybar/config &
polybar bar2 -c ~/.dotfiles/polybar/config &
polybar topbar1 -c ~/.dotfiles/polybar/config &
polybar topbar2 -c ~/.dotfiles/polybar/config &