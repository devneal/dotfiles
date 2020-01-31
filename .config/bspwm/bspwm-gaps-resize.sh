#!/bin/sh

# Allows resizing bspwm gaps using a single binding over the nm keys, e.g.
# super+alt+{nm}.
#
# Usage: bspwm-gaps-resize.sh expand|contract difference

action=$1
difference=$2

# Ensure valid arguments.
if [ "$action" != "expand" ] && [ "$action" != "contract" ]; then
    >&2 echo "Invalid action $action"
    exit 1
fi

match=$(expr "$difference" : "[[:digit:]][[:digit:]]*")
if [ "$match" = "0" ]; then
    >&2 echo "Invalid difference $difference"
    exit 1
fi

current_gap_size=$(bspc config window_gap)
if [ "$action" = "expand" ]; then
    bspc config window_gap $((current_gap_size + difference))
else
    new_gap_size=$((current_gap_size - difference))
    if [ $new_gap_size -ge 0 ]; then
        bspc config window_gap $new_gap_size
    fi
fi