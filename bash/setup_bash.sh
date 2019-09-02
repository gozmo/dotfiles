cp ~/.bashrc $BACKUP_FOLDER/.bashrc

sudo apt-get install fonts-powerline
pip3 install powerline-shell

echo "source ${PWD}/bash/bashrc" >> ~/.bashrc
