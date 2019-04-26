#!/bin/bash

if [ -f $HOME/.bashrc ]; then
    rm $HOME/.bashrc
fi
ln -s {$(pwd),$HOME}/.bashrc

if [ -f $HOME/.vimrc ]; then
    rm $HOME/.vimrc
fi
ln -s {$(pwd),$HOME}/.vimrc

if [ ! -d $HOME/.config/i3 ]; then
    mkdir -p $HOME/.config/i3
elif [ -f $HOME/.config/i3/config ]; then
    rm $HOME/.config/i3/config
fi
ln -s {$(pwd),$HOME}/.config/i3/config

if [ ! -d $HOME/.config/polybar ]; then
    mkdir -p $HOME/.config/polybar
elif [ -f $HOME/.config/polybar/config ]; then
    rm $HOME/.config/polybar/config
fi
ln -s {$(pwd),$HOME}/.config/polybar/config

if [ -d $HOME/.fonts ]; then
    rm -rf $HOME/.fonts
fi
ln -s {$(pwd),$HOME}/.fonts
