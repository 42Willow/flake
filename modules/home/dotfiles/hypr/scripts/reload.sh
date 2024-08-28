#!/usr/bin/env bash

# TODO: make this restart nix stuff properly

processes=(
  "hyprpaper",
  "waybar"
)

# See https://docs.gtk.org/Pango/pango_markup.html for possible formatting

for process in "${processes[@]}"; do
    if pgrep -x ".$process-wrapped" > /dev/null; then
      killall ".$process-wrapped"
      hyprctl dispatch exec "$process"
      # dunstify "reload.sh" "restarted <b>$process</b>"
    else
      # dunstify "reload.sh" "<b>$process</b> is not running, starting it..."
      hyprctl dispatch exec "$process"
      # dunstify "reload.sh" "started <b>$process</b>"
    fi
done
