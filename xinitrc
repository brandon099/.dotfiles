# Reverse PRIME if on machine with 2 gpus
xrandr --setprovideroutputsource nouveau Intel

# Set up displays -- monitors script returns the xrandr command needed to set up the displays
xrandr --query | grep "connected" | awk -F' ' '{print $1 $2}' | xargs string_set | monitors | sh

# Set default cursor
xsetroot -cursor_name left_ptr

# Set Desktop Background
feh --bg-fill /home/bclifford/pictures/wallpapers/yosemite.png

# Start compositor
compton -b

# Numlock state save
numlockx &

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
