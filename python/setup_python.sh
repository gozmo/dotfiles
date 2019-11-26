python3 -m pip install --user pudb



git clone https://github.com/pyenv/pyenv.git ~/.pyenv
git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv

mkdir -p "{HOME}"/.config/pudb
ln -s "{HOME}"/.config/pudb/pudb.cfg "{PWD}"/python/pudb.cfg
