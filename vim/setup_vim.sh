mkdir -p ~/.vim

ln -s "${PWD}/vim/vimrc" ~/.vimrc
ln -s "${PWD}/vim/useful_bindings.txt" ~/.vim/useful_bindings.txt
cp -r "${PWD}/vim/colors" ~/.vim/
cd ~/.vim

sudo apt-get install exuberant-ctags

#fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# ripgrep
sudo add-apt-repository ppa:x4121/ripgrep
sudo apt-get update
sudo apt-get install ripgrep

git clone https://github.com/tpope/vim-pathogen.git
mv vim-pathogen/autoload .
rm -fr vim-pathogen

mkdir ~/.vim/bundle
cd ~/.vim/bundle
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/scrooloose/nerdcommenter.git
git clone https://github.com/jaxbot/semantic-highlight.vim.git
git clone https://github.com/bling/vim-airline.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/bronson/vim-trailing-whitespace.git
git clone https://github.com/fholgado/minibufexpl.vim.git
git clone https://github.com/mbbill/undotree.git
git clone https://github.com/jceb/vim-orgmode.git
git clone git://github.com/tpope/vim-speeddating.git #Dep for orgmode
git clone git://github.com/majutsushi/tagbar
git clone https://github.com/ludovicchabant/vim-gutentags
git clone https://github.com/easymotion/vim-easymotion
git clone https://github.com/chrisbra/NrrwRgn
git clone https://github.com/tpope/vim-surround
git clone https://github.com/airblade/vim-gitgutter
git clone https://github.com/vim-scripts/ZoomWin
git clone https://github.com/junegunn/fzf.vim
git clone --recursive https://github.com/davidhalter/jedi-vim.git
