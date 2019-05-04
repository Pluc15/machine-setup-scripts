#
# ~/.bashrc
#

[[ $- != *i* ]] && return

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

alias ls='ls --color=auto'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
alias cp="cp -i"
alias df='df -h'
alias free='free -m'
alias np='nano -w PKGBUILD'
alias more=less
xhost +local:root > /dev/null 2>&1
complete -cf sudo
shopt -s checkwinsize
shopt -s expand_aliases
shopt -s histappend