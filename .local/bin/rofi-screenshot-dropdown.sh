#!/bin/sh
ROFI_Y_MARGIN=5

screen_width="$(xwininfo -root | grep Width | awk '{print $2}')"
polybar_id="$(xdotool search --class Polybar)"
polybar_width="$(xwininfo -id "$polybar_id" | grep Width | awk '{print $2}')"
polybar_height="$(xwininfo -id "$polybar_id" | grep Height | awk '{print $2}')"
polybar_padding="$(printf "(%s - %s) / 2\n" "$screen_width" "$polybar_width" | bc)"

dropdown_y_offset="$((polybar_height + ROFI_Y_MARGIN))"
dropdown_x_offset="$((polybar_padding))"

rofi -theme-str "$(printf "configuration { \
    location: 3; \
    yoffset: %s; \
    xoffset: -%s; \
    lines: 3; \
    font: \"SauceCodePro Nerd Font Mono 25\"; \
    width: 20; \
} #element { \
    padding: 25; \
} #inputbar { \
    padding: 25; \
}" "$dropdown_y_offset" "$dropdown_x_offset")" \
     -modi " Screenshot":rofi-screenshot.sh \
     -show " Screenshot"
