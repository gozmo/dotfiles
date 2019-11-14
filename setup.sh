export BACKUP_FOLDER="${HOME}/.dotfiles_backup/$(date +%Y-%m-%dT%H:%M:%S)"
mkdir -p "$BACKUP_FOLDER"
mkdir "$BACKUP_FOLDER"/bash
mkdir "$BACKUP_FOLDER"/git
mkdir "$BACKUP_FOLDER"/tmux
mkdir "$BACKUP_FOLDER"/vim

#bash ./bash/setup_bash.sh
#bash ./git/setup_git.sh
#bash ./tmux/setup_tmux.sh
bash ./vim/setup_vim.sh
