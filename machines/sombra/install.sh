sudo cp "$DOTFILES/machines/sombra/etc/udev/rules.d/backlight.rules" "/etc/udev/rules.d/backlight.rules"
sudo chown root:root "/etc/udev/rules.d/backlight.rules"
sudo groupadd video
sudo usermod -a -G video pluc
