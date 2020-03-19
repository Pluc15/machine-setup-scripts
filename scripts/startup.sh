# Single run commands
nitrogen --restore

# Services
compton -b
x11vnc -display :0 -usepw -forever -bg
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# Systrays
remmina -i &
nm-applet &
redshift-gtk &
pasystray &
cbatticon &

# Scratch pad apps
discord &
slack &
arandr &
