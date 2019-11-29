sudo apt-get install fonts-powerline

if ! hash powerline-shell 2>/dev/null
then
    pip3 install --user powerline-shell
fi
 

if [ -f $HOME/.bashrc ]
then
    mv $HOME/.bashrc $HOME/.bashrc.local
    ln -s $HOME/dotfiles/bash/bashrc $HOME/.bashrc
fi

if [ -L $HOME/.bashrc ]
then
    rm $HOME/.bashrc
    ln -s $HOME/dotfiles/bash/bashrc $HOME/.bashrc
fi
