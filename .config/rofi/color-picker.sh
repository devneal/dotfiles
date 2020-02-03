#!/bin/sh

BASE16_DIR="$HOME/github/base16-builder-python"
BASE16_SCHEME_DIR="$BASE16_DIR/schemes"
ALACRITTY_YML="$XDG_CONFIG_HOME/alacritty/alacritty.yml"
ROFI_RASI="$XDG_CONFIG_HOME/rofi/config.rasi"
XRESOURCES="$HOME/.Xresources"

if [ "$#" = 0 ]; then
    for scheme_yaml in $(find "$BASE16_SCHEME_DIR" -name "*.yaml" | sort); do
        printf "%s\n" "$(basename "$scheme_yaml" .yaml)"
    done
else
    (cd "$BASE16_DIR" || exit 1; ./pybase16.py inject -s "$1" \
        -f "$ALACRITTY_YML" \
        -f "$ROFI_RASI" \
        -f "$XRESOURCES")
fi
