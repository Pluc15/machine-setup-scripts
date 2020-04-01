#!/bin/sh
set -e

function usage()
{
    echo "$0"
    echo "\t-h --help"
    echo "\t--skip-all (use first then re-enable individually)"
    echo "\t--refresh-pacman-keys (disabled by default)"
    echo "\t--install-all-packages (includes pacman, yay and aur)"
    echo "\t--install-pacman-packages"
    echo "\t--install-yay"
    echo "\t--install-aur-packages"
    echo "\t--install-dotnet-tools-dependencies"
    echo "\t--install-npm-dependencies"
    echo "\t--create-configuration-symlinks"
    echo "\t--create-shell-env-variables"
    echo "\t--install-wallpaper"
    echo "\t--configure"
    echo "\t--audit"
    echo ""
}

export DOTFILES=`dirname $0`
export DOTFILES=`realpath $DOTFILES`

REFRESH_PACMAN_KEYS=0
INSTALL_PACMAN_PACKAGES=1
INSTALL_YAY=1
INSTALL_AUR_PACKAGES=1
INSTALL_DOTNET_TOOLS_DEPENDENCIES=1
INSTALL_NPM_DEPENDENCIES=1
CREATE_CONFIGURATION_SYMLINKS=1
CREATE_SHELL_ENV_VARIABLES=1
INSTALL_WALLPAPER=1
CONFIGURE=1
RUN_AUDIT=1

while [ "$1" != "" ]; do
    case $1 in
        -h | --help)
            usage
            exit
            ;;
        --refresh-pacman-keys)
            REFRESH_PACMAN_KEYS=1
            ;;
        --skip-all)
            REFRESH_PACMAN_KEYS=0
            INSTALL_PACMAN_PACKAGES=0
            INSTALL_YAY=0
            INSTALL_AUR_PACKAGES=0
            INSTALL_DOTNET_TOOLS_DEPENDENCIES=0
            INSTALL_NPM_DEPENDENCIES=0
            CREATE_CONFIGURATION_SYMLINKS=0
            CREATE_SHELL_ENV_VARIABLES=0
            INSTALL_WALLPAPER=0
            CONFIGURE=0
            RUN_AUDIT=0
            ;;
        --install-all-packages)
            INSTALL_PACMAN_PACKAGES=1
            INSTALL_YAY=1
            INSTALL_AUR_PACKAGES=1
            ;;
        --install-pacman-packages)
            INSTALL_PACMAN_PACKAGES=1
            ;;
        --install-yay)
            INSTALL_YAY=1
            ;;
        --install-aur-packages)
            INSTALL_AUR_PACKAGES=1
            ;;
        --install-dotnet-tools-dependencies)
            INSTALL_DOTNET_TOOLS_DEPENDENCIES=1
            ;;
        --install-npm-dependencies)
            INSTALL_NPM_DEPENDENCIES=1
            ;;
        --create-configuration-symlinks)
            CREATE_CONFIGURATION_SYMLINKS=1
            ;;
        --create-shell-env-variables)
            CREATE_SHELL_ENV_VARIABLES=1
            ;;
        --install-wallpaper)
            INSTALL_WALLPAPER=1
            ;;
        --configure)
            CONFIGURE=1
            ;;
        --audit)
            RUN_AUDIT=1
            ;;
        *)
            echo "ERROR: unknown parameter \"$PARAM\""
            usage
            exit 1
            ;;
    esac
    shift
done

echoStep() {
    echo ""
    echo -e "== $1 =="
}

refreshPacmanKeys() {
    echoStep "Updating pacman keys"

    sudo pacman-key --refresh-keys
    pacman -Sy archlinux-keyring && pacman -Su
}

installPacmanPackages() {
    echoStep "Installing / updating pacman packages"

    sudo pacman -Syu --needed \
        arandr \
        arc-gtk-theme \
        arch-audit \
        aspnet-runtime \
        cbatticon \
        cheese \
        chromium \
        cifs-utils \
        code \
        compton \
        curl \
        deepin-system-monitor \
        deluge \
        discord \
        docker \
        dotnet-host \
        dotnet-runtime \
        dotnet-sdk \
        dunst \
        efibootmgr \
        feh \
        fish \
        freerdp \
        fzf \
        gimp \
        git \
        glances \
        gnome-themes-extra \
        gparted \
        gufw \
        htop \
        i3-gaps \
        i3lock \
        i3status \
        kde-applications-meta \
        kde-gtk-config \
        lastpass-cli \
        lib32-nvidia-utils \
        lib32-vulkan-icd-loader \
        libreoffice \
        lm_sensors \
        lutris \
        lxappearance \
        neofetch \
        network-manager-applet \
        networkmanager \
        networkmanager-openvpn \
        networkmanager-pptp \
        nitrogen \
        nm-connection-editor \
        nodejs \
        npm \
        ntfs-3g \
        nvidia \
        nvidia-settings \
        nvidia-utils \
        obs-studio \
        opencl-nvidia \
        openssh \
        pacman-contrib \
        pacman-mirrorlist \
        pamixer \
        papirus-icon-theme \
        paprefs \
        pasystray \
        pavucontrol \
        plasma-meta \
        polkit \
        polkit-gnome \
        pulseaudio \
        pulseaudio-alsa \
        pulseaudio-jack \
        pulseeffects \
        qt5ct \
        redshift \
        remmina \
        rofi \
        rsync \
        rxvt-unicode \
        s-tui \
        scrot \
        speedtest-cli \
        steam \
        steam-native-runtime \
        thunar \
        tk \
        transmission-cli \
        transmission-gtk \
        ttf-fira-code \
        ttf-font-awesome \
        tumbler \
        viewnior \
        vlc \
        vulkan-icd-loader \
        wget \
        x11vnc \
        xdotool \
        xorg \
        xorg-apps \
        xorg-xbacklight \
        xorg-xinit \
        yarn \

}

installYay() {
    echoStep "Installing / updating yay"

    pushd ~/.aur
    if [ ! -d "yay" ]
    then
        git clone https://aur.archlinux.org/yay.git
    fi
    cd yay
    git reset --hard
    git pull
    makepkg -si --needed
    popd
}

installAurPackages() {
    echoStep "Installing / updating AUR packages"

    # --needed doesn't prevent redownloading sources. See https://github.com/Jguer/yay/issues/885
    yay -Syu \
        --aur \
        --needed \
        --noremovemake \
        --answerclean n \
        --answerdiff n \
        --noconfirm \
        adwaita-qt \
        foldingathome \
        jetbrains-toolbox \
        mongodb-compass \
        slack-desktop \
        webtorrent-desktop-bin \
        spotify \

}

installDotnetToolsDependencies() {
    echoStep "Installing dotnet tools"

    if dotnet tool list -g | grep -q "dotnet-script"
    then 
    dotnet tool update -g dotnet-script
    else
    dotnet tool install -g dotnet-script
    fi
}

installNpmDependencies() {
    echoStep "Installing npm dependencies"

    npm i
}

createConfigurationSymlinks() {
    echoStep "Linking configuraion files"

    mkdir -p "$HOME/.scripts"
    mkdir -p "$HOME/.config/dunst"
    mkdir -p "$HOME/.config/gtk-3.0"
    mkdir -p "$HOME/.config/i3"
    mkdir -p "$HOME/.config/i3status"
    mkdir -p "$HOME/.config/nitrogen"
    mkdir -p "$HOME/.config/profile.d"
    mkdir -p "$HOME/.config/rofi"
    mkdir -p "$HOME/.config/Xresources.d"
    mkdir -p "$HOME/Pictures/Screenshots"

    ln -fs "$DOTFILES/configs/.gitconfig"                                        "$HOME/.gitconfig"
    ln -fs "$DOTFILES/configs/.gtkrc-2.0"                                        "$HOME/.gtkrc-2.0"
    ln -fs "$DOTFILES/configs/.gtkrc-2.0.mine"                                   "$HOME/.gtkrc-2.0.mine"
    ln -fs "$DOTFILES/configs/.profile"                                          "$HOME/.profile"
    ln -fs "$DOTFILES/configs/.xinitrc"                                          "$HOME/.xinitrc"
    ln -fs "$DOTFILES/configs/.config/compton.conf"                              "$HOME/.config/compton.conf"
    ln -fs "$DOTFILES/configs/.config/dunst/dunstrc"                             "$HOME/.config/dunst/dunstrc"
    ln -fs "$DOTFILES/configs/.config/gtk-3.0/colors.css"                        "$HOME/.config/gtk-3.0/colors.css"
    ln -fs "$DOTFILES/configs/.config/gtk-3.0/gtk.css"                           "$HOME/.config/gtk-3.0/gtk.css"
    ln -fs "$DOTFILES/configs/.config/gtk-3.0/settings.ini"                      "$HOME/.config/gtk-3.0/settings.ini"
    ln -fs "$DOTFILES/configs/.config/i3/config"                                 "$HOME/.config/i3/config"
    ln -fs "$DOTFILES/configs/.config/i3status/config"                           "$HOME/.config/i3status/config"
    ln -fs "$DOTFILES/configs/.config/profile.d/01-environment-variables.sh"     "$HOME/.config/profile.d/01-environment-variables.sh"
    ln -fs "$DOTFILES/configs/.config/redshift.conf"                             "$HOME/.config/redshift.conf"
    ln -fs "$DOTFILES/configs/.config/rofi/config"                               "$HOME/.config/rofi/config"
    ln -fs "$DOTFILES/configs/.config/rofi/rofi-my-dark-theme.rasi"              "$HOME/.config/rofi/rofi-my-dark-theme.rasi"
    ln -fs "$DOTFILES/configs/.config/Xresources.d/00-base"                      "$HOME/.config/Xresources.d/00-base"
    ln -fs "$DOTFILES/configs/.config/Xresources.d/10-theme"                     "$HOME/.config/Xresources.d/10-theme"
}

createShellEnvVariables() {
    echoStep "Create profile script for dotfiles environment variables"

    echo '#!/bin/sh'                                                                          >  "$HOME/.config/profile.d/00-dotfiles-generated.sh"
    echo "## Everything in this file will be erased next time you run the dotfiles installer" >> "$HOME/.config/profile.d/00-dotfiles-generated.sh"
    echo "export DOTFILES=$DOTFILES"                                                          >> "$HOME/.config/profile.d/00-dotfiles-generated.sh"
    echo "PATH=\$PATH:$DOTFILES/bin"                                                          >> "$HOME/.config/profile.d/00-dotfiles-generated.sh"
    echo "PATH=\$PATH:$HOME/.scripts"                                                         >> "$HOME/.config/profile.d/00-dotfiles-generated.sh"
}

installWallpaper() {
    echoStep "Install wallpaper"

    nitrogen --head=0 --set-zoom-fill --save "$DOTFILES/wallpaper.*"
    nitrogen --head=1 --set-zoom-fill --save "$DOTFILES/wallpaper.*" 2> /dev/null
    nitrogen --head=2 --set-zoom-fill --save "$DOTFILES/wallpaper.*" 2> /dev/null
    nitrogen --head=3 --set-zoom-fill --save "$DOTFILES/wallpaper.*" 2> /dev/null
}

configure() {
    if [ ! -f "$HOME/.vnc/passwd" ]
    then
        echoStep "Configure x11vnc password"
        x11vnc -storepasswd
    fi
}

runAudit() {
    echoStep "Running pacman packages audit -- PLEASE READ THE OUTPUT"

    arch-audit
}

cd $DOTFILES
# TODO git fetch and check if HEAD == origin/master
if [ $REFRESH_PACMAN_KEYS -eq 1 ]; then refreshPacmanKeys; fi
if [ $INSTALL_PACMAN_PACKAGES -eq 1 ]; then installPacmanPackages; fi
if [ $INSTALL_YAY -eq 1 ]; then installYay; fi
if [ $INSTALL_AUR_PACKAGES -eq 1 ]; then installAurPackages; fi
if [ $INSTALL_DOTNET_TOOLS_DEPENDENCIES -eq 1 ]; then installDotnetToolsDependencies; fi
if [ $INSTALL_NPM_DEPENDENCIES -eq 1 ]; then installNpmDependencies; fi
if [ $CREATE_CONFIGURATION_SYMLINKS -eq 1 ]; then createConfigurationSymlinks; fi
if [ $CREATE_SHELL_ENV_VARIABLES -eq 1 ]; then createShellEnvVariables; fi
if [ $INSTALL_WALLPAPER -eq 1 ]; then installWallpaper; fi
if [ $CONFIGURE -eq 1 ]; then configure; fi
if [ $RUN_AUDIT -eq 1 ]; then runAudit; fi
echoStep "Done!"
echo "==> You should restart your X session"
