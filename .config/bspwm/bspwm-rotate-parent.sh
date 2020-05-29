#!/bin/sh

# Rotate a parent node while a child node is focused.
#
# Usage: bspwm-rotate-parent.sh 90|180|270

degrees="$1"

if [ "$degrees" != "90" ] && [ "$degrees" != "180" ] && [ "$degrees" != "270" ]; then
    >&2 echo "Invalid rotation $degrees"
    exit 1
fi

bspc node "$(bspc query --nodes --node @parent)" -R "$degrees"
