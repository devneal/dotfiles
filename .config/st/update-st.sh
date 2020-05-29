#!/bin/sh

# Install st with a modified config.h.
#
# Usage: update-st.sh [global]

ST_SOURCE_PATH="$HOME/github/st"
ST_CONFIG_PATH="$HOME/.config/st"
cp "$ST_CONFIG_PATH/config.h" "$ST_SOURCE_PATH"
cd "$ST_SOURCE_PATH"

if [ "$#" = "0" ]; then
    PREFIX="$HOME/.local" make -e clean install
elif [ "$#" = "1" ] && [ "$1" = "global" ]; then
    sudo make clean install
else
    printf "Invalid arguments." >&2
fi

printf "Cleaning source directory...\n"
make clean
rm config.h
