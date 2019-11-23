mkdir -p ~/.vim

ln -s "${HOME}/dotfiles/vim/vimrc" ~/.vimrc
cd ~/.vim


#fzf
if ! hash fzf 2>/dev/null
then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi

# ripgrep
if ! hash rg 2>/dev/null
then
    curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
    sudo dpkg -i ripgrep_11.0.2_amd64.deb
fi

git clone https://github.com/tpope/vim-pathogen.git
mv vim-pathogen/autoload .
rm -fr vim-pathogen

export BUNDLE_DIR=~/.vim/bundle
if [ -d "$BUNDLE_DIR" ]
then
    rm -fr $BUNDLE_DIR
fi

mkdir $BUNDLE_DIR
cd $BUNDLE_DIR
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/scrooloose/nerdcommenter.git
git clone https://github.com/bling/vim-airline.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/mbbill/undotree.git
git clone https://github.com/ludovicchabant/vim-gutentags
git clone https://github.com/airblade/vim-gitgutter
git clone https://github.com/junegunn/fzf.vim
git clone https://github.com/vimwiki/vimwiki.git
git clone https://github.com/junegunn/goyo.vim.git
git clone https://github.com/RRethy/vim-illuminate.git
git clone --recursive https://github.com/davidhalter/jedi-vim.git
git clone git://github.com/majutsushi/tagbar

#themes
git clone https://github.com/lisposter/vim-blackboard.git
git clone https://github.com/arcticicestudio/nord-vim.git
git clone https://github.com/drewtempelmeyer/palenight.vim.git
git clone https://github.com/morhetz/gruvbox.git
git clone https://github.com/jacoborus/tender.vim.git

# Remove?
git clone https://github.com/jaxbot/semantic-highlight.vim.git
