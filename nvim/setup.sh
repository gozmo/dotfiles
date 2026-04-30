curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod u+x nvim-linux-x86_64.appimage
mkdir -p ~/opt/nvim/
mv nvim-linux-x86_64.appimage ~/opt/nvim/nvim

python3 -m pip install --user --upgrade pynvim
python3 -m pip install --user --upgrade pyright
python3 -m pip install --user --upgrade ruff

# Install shell tools
sudo apt install -y ripgrep fd-find fzf jq

# Create aliases
echo "alias rg='rg --pretty'" >> ~/.bashrc
echo "alias fd='fdfind'" >> ~/.bashrc
source ~/.bashrc

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

mkdir -p ~/.config/nvim

if [[ -L $HOME/.config/nvim/init.vim ]]
then
    rm $HOME/.config/nvim/init.vim
fi
ln -s "${HOME}/dotfiles/nvim/init.vim" ~/.config/nvim/init.vim

# Install lua-language-server
mkdir -p ~/opt/lua-language-server
curl -L -o ~/opt/lua-language-server/install.sh https://raw.githubusercontent.com/LuaLS/lua-language-server/master/install.sh
bash ~/opt/lua-language-server/install.sh
rm ~/opt/lua-language-server/install.sh

# Install stylua (optional, for lua formatting)
mkdir -p ~/opt/stylua
curl -L -o ~/opt/stylua/install.sh https://raw.githubusercontent.com/JohnnyMorganz/stylua/master/install.sh
bash ~/opt/stylua/install.sh
rm ~/opt/stylua/install.sh

# nvim-tree.lua dependency
npm install -g tree-sitter-cli