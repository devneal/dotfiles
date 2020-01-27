#!/usr/bin/dash

# Find a way to resize bspwm using one set of hjkl keys
# (e.g. super+alt+{hjkl})
#
# There is an old script for doing this at https://github.com/noctuid/dotfiles#consolidate-bspwm-resizing-keybindings,
# but it is written rather badly.
#
# Roughly, to expand a window in a direction (while tiled):
# If there is no border to the left/bottom:
#     expand in that direction
# else:
#     expand in the opposite direction

action=$1
axis=$2
difference=$3

# Ensure valid arguments.
if [ "$action" != "expand" ] && [ "$action" != "contract" ]; then
    notify-send "Invalid action $action"
    exit 1
fi

if [ "$axis" != "horizontal" ] && [ "$axis" != "vertical" ]; then
    notify-send "Invalid axis $axis"
    exit 1
fi

match=$(expr match "$difference" "[[:digit:]][[:digit:]]*")
if [ "$match" = "0" ]; then
    notify-send "Invalid difference $difference"
    exit 1
fi

if [ "$action" = "contract" ]; then
    if [ "$axis" = "horizontal" ]; then
        if [ -z "$(bspc query --nodes --node focused\#east)" ]; then
            handle="left"
            sign="+"
        else
            handle="right"
            sign="-"
        fi
    else
        if [ -z "$(bspc query --nodes --node focused\#south)" ]; then
            handle="top"
            sign="+"
        else
            handle="bottom"
            sign="-"
        fi
    fi
else
    if [ "$axis" = "horizontal" ]; then
        if [ -z "$(bspc query --nodes --node focused\#east)" ]; then
            handle="left"
            sign="-"
        else
            handle="right"
            sign="+"
        fi
    else
        if [ -z "$(bspc query --nodes --node focused\#south)" ]; then
            handle="top"
            sign="-"
        else
            handle="bottom"
            sign="+"
        fi
    fi
fi

if [ "$axis" = "horizontal" ]; then
    dx="$sign$difference"
    dy=0
else
    dx=0
    dy="$sign$difference"
fi

bspc node -z $handle $dx $dy
