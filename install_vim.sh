#! /bin/bash

# Description:
#   Compile a full-featured Vim from source on Ubuntu/Debian distros. Based
#   entirely on
#   https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source
#
# Use:
#   ./compile_full_vim.sh

sudo apt remove -y \
	vim \
	vim-runtime \
	gvim \
	vim-tiny \
	vim-common \
	vim-gui-common

sudo apt install -y \
	libncurses5-dev \
	libgnome2-dev \
	libgnomeui-dev \
	libgtk2.0-dev \
	libatk1.0-dev \
	libbonoboui2-dev \
	libcairo2-dev \
	libx11-dev \
	libxpm-dev \
	libxt-dev \
	python-dev \
	python3-dev \
    ruby-dev \
	git \
    ripgrep \
    fzf

cd ~/Code
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
	--enable-multibyte \
	--enable-rubyinterp \
	--enable-python3interp \
    --with-python3-config-dir=/usr/lib/python3.6/config-3.6m-x86_64-linux-gnu/ \
	--enable-perlinterp \
	--enable-luainterp \
	--enable-gui=gtk2 \
	--enable-cscope \
	--prefix=/usr
make
sudo make install

# curl for auto-installing vim-plug and pynvim for deoplete
sudo apt install -y curl python3-pip
pip3 install --user pynvim

