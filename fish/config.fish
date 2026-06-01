source $HOME/dotfiles/fish/variables.fish

set FLINE_PATH $HOME/opt/fishline
source $FLINE_PATH/fishline.fish

function fish_prompt
    fishline -s $status
end

alias tmux='tmux -2'
alias ll='ls -alF --color=auto'
alias la='ls -A --color=auto'
alias ls='ls --color=auto'
alias l='ls -CF --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

test -f ~/.fzf.fish; and source ~/.fzf.fish

if status is-interactive; and not set -q TMUX
    exec tmux
end

test -f $HOME/.config/fish/config.fish_old; and source $HOME/.config/fish/config.fish_old
