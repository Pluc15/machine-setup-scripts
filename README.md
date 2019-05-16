# Installing

- Clone
- `sh install.sh`

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
- Improve look
  - Map pywal colors to [JetBrains IDEs](https://github.com/0x6C38/intellijPywal)
  - Map pywal colors to Visual Sutido Code
  - Map pywal colors to GTK 2/3
  - Map pywal colors to QT
  - Improve color mapping in Polybar
  - Fix / add icons in Polybar
  - Add GTK theme reload to bin/reload
- Prevent pulseaudio to go over 100% with shortcuts (PA_VOLUME_UI_MAX?)
- Make it not machine specific
  - Polybar's PulseAudio sink
- Make it work on Arch
- Health check on i3 start