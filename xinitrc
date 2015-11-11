# Set up displays -- monitors script returns the xrandr command needed to set up the displays
xrandr --query | grep "connected" | awk -F' ' '{print $1 $2}' | xargs string_set | monitors | sh

# Set default cursor
xsetroot -cursor_name left_ptr

# Set mouse acceleration
xset m 3/1 4

# Map menu button to Mod4
if [ -s ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi

# Set Desktop Background
feh --bg-fill /home/bclifford/Pictures/wallpapers/wallpaper.jpg

# Start compositor
compton -b

# Start Dunst Notification Daemon
dunst &

# Numlock state save
numlockx &

# Unclutter mouse cursor
unclutter &

# Add fonts to path and rehash
xset fp+ /usr/share/fonts/misc
xset fp rehash

# Source Xresources
xrdb ~/.Xresources

# Launch Urxvt daemon
urxvtd -f -q -o

# Start Simple X Hotkey Daemon
sxhkd &

# Start Window Manager
exec bspwm
