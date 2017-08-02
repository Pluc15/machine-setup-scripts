#!/bin/bash
pactl set-sink-mute 0 toggle
notify-send "Pulse Audio" "Mute toggled"