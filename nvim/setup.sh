curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod u+x nvim-linux-x86_64.appimage
mkdir -p ~/opt/nvim/
mv nvim-linux-x86_64.appimage ~/opt/nvim/nvim




sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

mkdir -p ~/.config/nvim

if [[ -L $HOME/.config/nvim/init.vim ]] 
then
	rm $HOME/.config/nvim/init.vim
fi
ln -s "${HOME}/dotfiles/nvim/init.vim" ~/.config/nvim/init.vim
#PlugInstall
