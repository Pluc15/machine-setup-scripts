mkdir -p "$HOME/.aur"
pushd "$HOME/.aur"
if [ ! -d "yay" ]
then
    git clone https://aur.archlinux.org/yay.git
fi
cd yay
# Shouldnt need this and it may slow down upgrades: git reset --hard
git pull
makepkg -si --needed
popd