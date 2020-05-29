#!/bin/sh

stow --ignore='.^git$' \
     --ignore='^README.md$' \
     --ignore='^stow.sh$' \
     -d . -t ~ --stow .
