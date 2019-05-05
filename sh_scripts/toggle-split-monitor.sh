#!/bin/sh
p2monitor=`xrandr --listmonitors`
if [[ $p2monitor == *"HDMI-0_p2"* ]]
then
    xrandr --delmonitor HDMI-0_p2
    xrandr --setmonitor HDMI-0 3440/819x1440/346+0+0 HDMI-0
elif [[ $p2monitor == *"HDMI-0"* ]]
then
    xrandr --setmonitor HDMI-0 2560/609x1440/346+0+0 HDMI-0
    xrandr --setmonitor HDMI-0_p2 880/210x1440/346+2560+0 none
fi
