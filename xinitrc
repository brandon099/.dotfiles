#!/usr/bin/env bash
# Set Desktop Background
hsetroot -solid "#8FA1B3"

# Start compositor
compton &

# Start Dunst Notification Daemon
dunst &

# Numlock state save
numlockx &

# Unclutter mouse cursor
unclutter &

# Redshift for location based monitor tint
redshift &

# Add fonts to path and rehash
xset fp+ /usr/share/fonts/misc
xset fp+ /usr/share/fonts/local
xset fp rehash

# Set default cursor
xsetroot -cursor_name left_ptr

# Source Xresources
xrdb ~/.Xresources

# Load machine specific keyboard mappings
if [ -s ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi

# Map CapsLock to Super
setxkbmap -option caps:super

# Start Simple X Hotkey Daemon
export SXHKD_SHELL='/usr/bin/sh'
sxhkd &

# Monitor Scripts
battmon &

# Start Window Manager
exec bspwm
