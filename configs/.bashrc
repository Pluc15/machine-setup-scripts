# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Add default arguments
alias ls='ls --color=auto'

# Prompt
set_bash_prompt(){
    PS1="${CL_WHITE}[${CL_LGRAY}\t${CL_WHITE}] ${CL_MAGENTA}\u${CL_CYAN}@${CL_PURPLE}\h ${CL_BLUE}\w\n${CL_LGRAY}>${CL_RESET} "
}
PROMPT_COMMAND=set_bash_prompt
