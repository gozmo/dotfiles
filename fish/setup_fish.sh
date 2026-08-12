sudo apt-get install -y fish 


mkdir -p $HOME/.config/fish

if [[ -f $HOME/.config/fish/config.fish || -L $HOME/.config/fish/config.fish ]]
then
    mv $HOME/.config/fish/config.fish $HOME/.config/fish/config.fish_old
fi
ln -s $HOME/dotfiles/fish/config.fish $HOME/.config/fish/config.fish
