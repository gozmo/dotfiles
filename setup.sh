l -s vimrc ../.vimrc

git clone https://github.com/tpope/vim-pathogen.git
mv vim-pathogen/autoload .
rm -fr vim-pathogen

mkdir bundle
cd bundle
git clone https://github.com/mileszs/ack.vim.git
git clone https://github.com/kien/ctrlp.vim.git
git clone https://github.com/sjl/gundo.vim.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/jaxbot/semantic-highlight.vim.git
git clone https://github.com/bling/vim-airline.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/bronson/vim-trailing-whitespace.git
git clone https://github.com/scrooloose/nerdcommenter.git
git clone https://github.com/fholgado/minibufexpl.vim.git
git clone https://github.com/gdetrez/vim-gf.git
git clone https://github.com/scrooloose/syntastic.git
