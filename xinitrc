# Set up displays -- monitors script returns the xrandr command needed to set up the displays
xrandr --query | grep " connected" | awk -F' ' '{print $1 $2}' | xargs string_set | monitors | sh

# Set default cursor
xsetroot -cursor_name left_ptr

# Map menu button to Mod4
if [ -s ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi

# Set Desktop Background
hsetroot -solid "#8FA1B3"

# Start compositor
compton -b

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
xset fp rehash

# Source Xresources
xrdb ~/.Xresources

# Start Simple X Hotkey Daemon
sxhkd &

# Monitor Scripts
battmon &

# Start Window Manager
exec bspwm
