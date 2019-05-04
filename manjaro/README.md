# Installing

- Clone
- `sh /path/to/dotfiles/manjaro/install.sh`

# Changing colors

- Use `wal` to generate a new scheme
- `sh $DOTFILES/sh_scripts/update-pywal-scheme.sh`
- `reload`

# TODOs

- Shell
    - Change prompt
- Driver
    - Fix screen tearing
    - Fix xbox controllers
    - Fix monitor selection not working at boot due to HDMI-0 not being renamed to HDMI-0_p1 yet (`sh $DOTFILES/sh_scripts/toggle-split-monitor.sh`)
- Styling
    - Map pywal colors to [JetBrains IDEs](https://github.com/0x6C38/intellijPywal)
    - Map pywal colors to Visual Sutido Code
    - Map pywal colors to GTK 2/3
    - Map pywal colors to QT
    - Improve color mapping in Polybar
    - Fix / add icons in Polybar
    - Add GTK theme reload to bin/reload
- Behavior
    - Prevent pulseaudio to go over 100% with shortcuts (PA_VOLUME_UI_MAX?)
- Dotfiles
    - Fix anything else that is machine specific
        - Polybar's PulseAudio sink
        - Monitor names
    - Make it worth on Arch