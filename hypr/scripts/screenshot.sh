#!/bin/bash

filename=screenshot_$(date "+%Y-%m-%d_%H:%M:%S").png
grim -g "$(slurp)" -o "$filename" - | wl-copy
