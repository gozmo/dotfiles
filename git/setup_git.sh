if [ -e ~/.gitconfig ]
then 
    rm ~/.gitconfig
fi

ln -s "${HOME}/dotfiles/git/gitconfig" ~/.gitconfig

