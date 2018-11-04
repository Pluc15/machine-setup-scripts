if [ -z "$DISPLAY" ]; and [ -n "$XDG_VTNR" ]; and [ "$XDG_VTNR" -eq 1 ]
  exec startx
end

set PATH $HOME/.scripts $PATH
set PATH $HOME/.dotnet/tools $PATH

alias ggt "git-tree"
alias ggs "git status"
alias ggph "git push"
alias ggpl "git pull"

alias paci "pacman -S $argv"
alias pacr "pacman -Rsn $argv"
alias pacl "pacman -Qqe"
alias pacuall "pacman -Syu"
alias paclaur "pacman -Qm"

