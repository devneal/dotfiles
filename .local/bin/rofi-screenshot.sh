#!/bin/bash
OUTPUT_FILE="$XDG_DATA_HOME/screenshots/$(date +"%m-%d-%Y-%H-%M-%S").png"
MS_PER_COUNT=1000
BUFFER_SECONDS=0.2
COUNTDOWN_SECONDS=3

countdown_desktop_capture() {
    countdown="$COUNTDOWN_SECONDS"
    while [ $countdown -ne 0 ]; do
        notify-send --expire-time="$MS_PER_COUNT" "$countdown"...
        sleep "$(printf "%s * 0.001\n" "$MS_PER_COUNT" | bc)"
        countdown=$((countdown - 1))
    done
    sleep "$BUFFER_SECONDS"
    maim "$OUTPUT_FILE"
    notify-send "Desktop saved to $OUTPUT_FILE"
}

if [ "$#" = 0 ]; then
    printf "麗 Selection\n Window\n Desktop"
else
    xdotool search --class Rofi windowclose

    if [ "$1" = " Desktop" ]; then
        countdown_desktop_capture &
    elif [ "$1" = " Window" ]; then
        maim -i "$(xdotool getactivewindow)" "$OUTPUT_FILE"
        notify-send "Window saved to $OUTPUT_FILE"
    elif [ "$1" = "麗 Selection" ]; then
        coproc (maim -s "$OUTPUT_FILE" && \
            notify-send "Selection saved to $OUTPUT_FILE")
    else
        exit 1
    fi
fi
