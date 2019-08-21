#!/bin/bash
#xprop -remove WM_NORMAL_HINTS -id $WIN
WIN=`xdotool getwindowfocus`
xdotool windowsize --sync $WIN 2560 1440
xdotool windowmove --sync $WIN 440 0