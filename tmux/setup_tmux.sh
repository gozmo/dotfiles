mkdir -p ~/.tmux/plugins

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

rm ~/.tmux.conf
ln -s "${HOME}/dotfiles/tmux/tmux.conf" ~/.tmux.conf
