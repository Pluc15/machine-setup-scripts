sudo pacman -S \
fish \
curl \
wget \
elinks \
xorg \
pulseaudio \
pavucontrol \
playerctl \
i3lock \
dunst \
freerdp \
pptpclient \
ranger \
base-devel \
git \
fzf \
feh \
redshift \
scrot \
imagemagick \
xdialog \
python-setuptools \
rofi \
gimp \
transmission-qt \
qt4 \
thunar \
xorg-xrandr \
arandr \
compton

git clone https://aur.archlinux.org/i3-gaps.git ~/.aur/i3-gaps
pushd ~/.aur/i3-gaps
makepkg -si
popd

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

git clone https://aur.archlinux.org/fisherman.git ~/.aur/fisherman
pushd ~/.aur/fisherman
makepkg -si
popd

git clone https://aur.archlinux.org/pkgbase/skypeforlinux-bin ~/.aur/skypeforlinux-bin
pushd ~/.aur/skypeforlinux-bin
makepkg -si
popd

git clone https://aur.archlinux.org/polybar-git.git ~/.aur/polybar-git
pushd ~/.aur/polybar-git
makepkg -si
popd

git clone https://aur.archlinux.org/python-pywal.git ~/.aur/python-pywal
pushd ~/.aur/python-pywal
makepkg -si
popd

fisher z fzf

mkdir -p ~/.config/i3
ln -fs ~/.dotfiles/i3/config ~/.config/i3/config

mkdir -p ~/.config/dunst
ln -fs ~/.dotfiles/dunst/dunstrc ~/.config/dunst/dunstrc

ln -fs ~/.dotfiles/xorg/.Xresources ~/.Xresources

ln -fs ~/.dotfiles/xorg/.xinitrc ~/.xinitrc

ln -fs ~/.dotfiles/fish/config.fish ~/.config/fish/config.fish

ln -fs ~/.dotfiles/compton/compton.conf ~/.config/compton.conf

ln -fs ~/.dotfiles/vscode/settings.json ~/.config/Code/User/settings.json

sudo rm /etc/pacman.d/mirrorlist
sudo ln -fs ~/.dotfiles/pacman/mirrorlist /etc/pacman.d/mirrorlist
