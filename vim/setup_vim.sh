mkdir -p ~/.vim
mv "${HOME}/vim/vimrc" "$BACKUP_FOLDER"/vim/vimrc

ln -s "${PWD}/vim/vimrc" ~/.vimrc
cd ~/.vim


#fzf
if ! type "$fzf" > /dev/null; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi

# ripgrep
if ! type "$rg" > /dev/null; then
    sudo add-apt-repository ppa:x4121/ripgrep
    sudo apt-get update
    sudo apt-get install ripgrep
fi

git clone https://github.com/tpope/vim-pathogen.git
mv vim-pathogen/autoload .
rm -fr vim-pathogen

export BUNDLE_DIR=~/.vim/bundle
if [ -d "$BUNDLE_DIR" ]; then
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
