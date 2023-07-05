mkdir -p ~/.tmux/plugins

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

if [ -e ~/.tmux.conf ]
then
    rm ~/.tmux.conf
fi
ln -s "${HOME}/dotfiles/tmux/tmux.conf" ~/.tmux.conf
