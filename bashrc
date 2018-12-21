
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
#export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
#export PROMPT_COMMAND="echo -n \[\$(date +%H:%M:%S)\]\ "
#http://bashrcgenerator.com/
export PS1="\[\033[38;5;9m\][\[$(tput sgr0)\]\[\033[38;5;249m\]\T\[$(tput sgr0)\]\[\033[38;5;9m\]]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;75m\]\u\[$(tput sgr0)\]\[\033[38;5;202m\]@\[$(tput sgr0)\]\[\033[38;5;38m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;157m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]\[$(tput sgr0)\]\[\033[33m\]\$(parse_git_branch)\[\033[00m\]> "

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Java debugging
export JAVA_OPTS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005"

#Start tmux on every login
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ack='ack-grep'
