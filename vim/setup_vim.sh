ln -s "${PWD}/vim/vimrc" ~/.vimrc


mkdir -p ~/.vim

cp -r "${PWD}/vim/colors" ~/.vim/
cd ~/.vim

git clone https://github.com/tpope/vim-pathogen.git
mv vim-pathogen/autoload .
rm -fr vim-pathogen

mkdir ~/.vim/bundle
cd ~/.vim/bundle
git clone https://github.com/mileszs/ack.vim.git
git clone https://github.com/kien/ctrlp.vim.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/jaxbot/semantic-highlight.vim.git
git clone https://github.com/bling/vim-airline.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/bronson/vim-trailing-whitespace.git
git clone https://github.com/scrooloose/nerdcommenter.git
git clone https://github.com/fholgado/minibufexpl.vim.git
git clone https://github.com/gdetrez/vim-gf.git
git clone https://github.com/mbbill/undotree.git
git clone https://github.com/szw/vim-tags.git
git clone https://github.com/jceb/vim-orgmode.git
git clone git://github.com/tpope/vim-speeddating.git #Dep for orgmode
git clone https://github.com/szw/vim-tags.git
git clone git://github.com/majutsushi/tagbar
