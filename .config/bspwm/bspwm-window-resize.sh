#!/usr/bin/dash

# Resize bspwm windows using a single binding over the hjkl keys, e.g.
# super+alt+{hjkl}
#
# Usage: bspwm-window-resize.sh expand|contract vertical|horizontal difference

action=$1
axis=$2
difference=$3

# Ensure valid arguments.
if [ "$action" != "expand" ] && [ "$action" != "contract" ]; then
    >&2 echo "Invalid action $action"
    exit 1
fi

if [ "$axis" != "horizontal" ] && [ "$axis" != "vertical" ]; then
    >&2 echo "Invalid axis $axis"
    exit 1
fi

match=$(expr match "$difference" "[[:digit:]][[:digit:]]*")
if [ "$match" = "0" ]; then
    >&2 echo "Invalid difference $difference"
    exit 1
fi

if [ "$action" = "contract" ]; then
    if [ "$axis" = "horizontal" ]; then
        if [ -z "$(bspc query --nodes --node east.local)" ]; then
            handle="left"
            sign="+"
        else
            handle="right"
            sign="-"
        fi
    else
        if [ -z "$(bspc query --nodes --node south.local)" ]; then
            handle="top"
            sign="+"
        else
            handle="bottom"
            sign="-"
        fi
    fi
else
    if [ "$axis" = "horizontal" ]; then
        if [ -z "$(bspc query --nodes --node east.local)" ]; then
            handle="left"
            sign="-"
        else
            handle="right"
            sign="+"
        fi
    else
        if [ -z "$(bspc query --nodes --node south.local)" ]; then
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
