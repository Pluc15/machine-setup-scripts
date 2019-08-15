# Services

systemdctl

# Manjaro default settings for each flavors

- https://gitlab.manjaro.org/profiles-and-settings/desktop-settings

# Init files info

> The xserverrc file is a shell script responsible for starting up the X server. Both startx and xinit execute ~/.xserverrc if it exists, startx will use /etc/X11/xinit/xserverrc otherwise.
> ~/.xinitrc is handy to run programs depending on X and set environment variables on X server startup. If it is present in a user's home directory, startx and xinit execute it. Otherwise startx will run the default /etc/X11/xinit/xinitrc.
> .bash_profile is executed for login shells, while .bashrc is executed for interactive non-login shells.
> When a Bourne compatible login shell starts, it first sources (parse & execute) the systemwide files like /etc/profile. Then it sources the user specific initialization file. Every user specific file resides in the particular user’s home directory which in most cases is /home/<user>/. So the file that login shell will source for user specific initialization is ~/.profile (~ is a shorthand for home directory).
> The original bourne shell was just called sh.Now, there are many Bourne compatible shells like the most famous is bash, another awesome shell is zsh. So this applies to all sh compatible shells, they first source /etc/profile, then their own systemwide config (like /etc/bashrc or /etc/zshrc) then for user specific init they source ~/.profile then they source their own login configs (~/.bash_profile or ~/.zprofile).

# Info about .bashrc .profile .xinitrc and environment variables

- https://wiki.archlinux.org/index.php/environment_variables

# Some info that may help with styling GTK

- https://wiki.archlinux.org/index.php/GTK+
- https://fishshell.com/docs/current/faq.html#faq-exported-uvar

# Manjaro default .profile

```
export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/nano
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=/usr/bin/palemoon
```

# Misc info

- blurlock comes from i3exit

# Example script that sets xprops on a windows (usefull for hotkeys that change how a window looks with compositor rules)

````bash
#!/bin/bash

ombra() {
    local active=$(xprop -notype -root _NET_ACTIVE_WINDOW)
    local status=$(xprop -notype -id ${active##*\ } _PLUC_OPAQUE)
    if [ "$status" = "_PLUC_OPAQUE = 1" ]; then
        xprop -id ${active##*\ } -remove _PLUC_OPAQUE
    else
        xprop -id ${active##*\ } -f _PLUC_OPAQUE 32c -set _PLUC_OPAQUE 1
    fi
}

ombra

exit 0```
````