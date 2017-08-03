sudo pacman -S \
\
#System
fish \
curl \
wget \
elinks \
xorg \
pulseaudio \
pavucontrol \
playerctl \
i3 \
i3status \
i3lock \
dmenu \
dunst \
freerdp \
pptpclient \
ranger \
base-devel \
git \
fzf \
\
#Dev
nodejs \
npm

git clone https://aur.archlinux.org/google-chrome.git ~/.aur/google-chrome
pushd ~/.aur/google-chrome
makepkg -si
popd

git clone https://aur.archlinux.org/spotify.git ~/.aur/spotify
pushd ~/.aur/spotify
makepkg -si
popd

git clone https://aur.archlinux.org/visual-studio-code.git ~/.aur/visual-studio-code
pushd ~/.aur/visual-studio-code
makepkg -si
popd

git clone https://aur.archlinux.org/x2vnc-no-xinerama.git ~/.aur/x2vnc-no-xinerama
pushd ~/.aur/x2vnc-no-xinerama
makepkg -si
popd

git clone https://aur.archlinux.org/ttf-font-awesome.git ~/.aur/ttf-font-awesome
pushd ~/.aur/ttf-font-awesome
makepkg -si
popd

git clone https://aur.archlinux.org/discord.git ~/.aur/discord
pushd ~/.aur/discord
makepkg -si
popd

git clone https://aur.archlinux.org/slack-desktop.git ~/.aur/slack-desktop
pushd ~/.aur/slack-desktop
makepkg -si
popd

#ln -fs ~/.dotfiles/xorg/xorg.conf /etc/X11/xorg.conf

mkdir -p ~/.config/i3
ln -fs ~/.dotfiles/i3/config ~/.config/i3/config

mkdir -p ~/.config/dunst
ln -fs ~/.dotfiles/dunst/dunstrc ~/.config/dunst/dunstrc

ln -fs ~/.dotfiles/xorg/Xresources ~/.Xresources

ln -fs ~/.dotfiles/xorg/xinitrc ~/.xinitrc

