sudo apt-get update
sudo apt-get upgrade
sudo apt-get install \
lastpass-cli \
fish \
openssh

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Fish autocomplete fix
sudo touch /bin/r && sudo chmod +x /bin/r
sudo touch /bin/R && sudo chmod +x /bin/R
sudo touch /bin/x86 && sudo chmod +x /bin/x86
sudo touch /bin/X86 && sudo chmod +x /bin/X86

# Fisher && fish plugins
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
fisher z fzf

echo "source /mnt/d/Dev/scripts/wsl/profile.fish" > ~/.config/fish/config.fish