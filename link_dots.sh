#!/bin/bash

rm $HOME/.bashrc
ln -s {$(pwd),$HOME}/.bashrc

rm $HOME/.config/i3/config
ln -s {$(pwd),$HOME}/.config/i3/config

rm $HOME/.config/polybar/config
ln -s {$(pwd),$HOME}/.config/polybar/config

rm $HOME/.fonts
ln -s {$(pwd),$HOME}/.fonts
