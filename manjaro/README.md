# Installing

- Clone
- `sh /path/to/dotfiles/manjaro/install.sh`

# Changing colors

- Use `wal` to generate a new scheme
- `sh $DOTFILES/sh_scripts/update-pywal-scheme.sh`
- `reload`

# TODOs

- Change prompt
- Fix screen tearing
- Fix xbox controllers
- Map pywal colors to
    - [JetBrains IDEs](https://github.com/0x6C38/intellijPywal)
    - Visual Sutido Code
    - GTK 2/3
    - QT
- Prevent pulseaudio to go over 100% with shortcuts (PA_VOLUME_UI_MAX?)
- Fix / add icons in Polybar
- Fix monitor selection not working at boot due to HDMI-0 not being renamed to HDMI-0_p1 yet (`sh $DOTFILES/sh_scripts/toggle-split-monitor.sh`)
- Take Polybar's pulseaudio sink from .profile (and initially install.sh)
- Take monitors from .profile (and initially install.sh)