mv "${HOME}/tmux/tmux.conf"  "$BACKUP_FILDER"/tmux/tmux.conf

mkdir -p ~/.tmux/plugins

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

ln -s "${PWD}/tmux/tmux.conf" ~/.tmux.conf
