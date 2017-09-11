#!/usr/bin/fish
set -x PATH $PATH /mnt/d/Dev/scripts/wsl
set -x PLUC_SCRIPTS /mnt/d/Dev/scripts/wsl
alias gs='git status'
alias gt='sh $PLUC_SCRIPTS/git-tree.sh'

#function fish_prompt
#    echo -ne $argv
#end
