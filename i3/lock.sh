#!/bin/bash
scrot /tmp/i3lock.png
convert /tmp/i3lock.png -blur 0x5 /tmp/i3lock.png
i3lock -i /tmp/i3lock.png
rm /tmp/i3lock.png