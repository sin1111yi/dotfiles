#!/bin/bash

rofi_config_path="$HOME/.config/rofi/config.rasi"

killall rofi || rofi -show drun -theme "$rofi_config_path" & sleep 0.5
hyprctl dispatch focuswindow "^(Rofi)"
