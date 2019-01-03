if [ -z "$DISPLAY" ]; and [ -n "$XDG_VTNR" ]; and [ "$XDG_VTNR" -eq 1 ]
  exec startx
end

alias paci "pacman -S $argv"
alias pacr "pacman -Rsn $argv"
alias pacl "pacman -Qqe"
alias pacuall "pacman -Syu"
alias paclaur "pacman -Qm"