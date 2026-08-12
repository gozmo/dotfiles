source $HOME/dotfiles/fish/variables.fish


# Render dynamic machine identity (prevent duplicate runs in Tmux/login shells)
if not set -q _MACHINE_NAME_PRINTED_TEST
    machine_name
    set -g _MACHINE_NAME_PRINTED_TEST true
end

set -gx OLLAMA_KEEP_ALIVE 1h
set -gx CLAUDE_CODE_MAX_OUTPUT_TOKENS 64000

alias tmux='tmux -2'
alias ll='ls -alF --color=auto'
alias la='ls -A --color=auto'
alias ls='ls --color=auto'
alias l='ls -CF --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'


#if status is-interactive; and not set -q TMUX
    #exec tmux
#end


# opencode
fish_add_path /home/gozmo/.opencode/bin
