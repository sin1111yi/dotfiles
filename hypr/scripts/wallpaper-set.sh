#!/bin/bash

h_wallpaper_path=$HOME/.wallpapers/h
v_wallpaper_path=$HOME/.wallpapers/v

random_h_wallpaper=$(find "$h_wallpaper_path" -type f | shuf -n 1)
random_v_wallpaper=$(find "$v_wallpaper_path" -type f | shuf -n 1)

swww-daemon &
swww img "$random_h_wallpaper" -o DP-1
swww img "$random_v_wallpaper" -o DP-3
