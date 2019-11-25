if ! hash powerline-shell 2>/dev/null
then
    pip3 install --user powerline-shell
fi
 
if egrep -q -e "/dotfiles/bash/bashrc" /home/goz/.bashrc
then
    echo "source ${HOME}/dotfiles/bash/bashrc" >> ~/.bashrc
fi
