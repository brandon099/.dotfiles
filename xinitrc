# Detect monitors and output to them
if [ "`xrandr --query | grep " connected" | wc -l`" -eq 3 ]
then
    xrandr --output LVDS-0 --off
    xrandr --output VGA-0 --off --output LVDS-0 --off --output DP-5 --off --output DP-4 --off --output DP-3 --off --output DP-2 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --mode 1920x1080 --pos 1920x0 --rotate normal --output DP-0 --off
#elif [ ! -z "`xrandr --query | grep " connected" | grep "DP-1"`" ]
#then
#    xrandr --output VGA-2 --off --output LVDS-2 --off --output LVDS1 --mode 1600x900 --pos 0x0 --rotate normal --output DP-3 --off --output DP-2 --off --output DP-1 --mode 1920x1080 --pos 1600x0 --rotate normal --output VGA1 --off
fi

# Set default cursor
xsetroot -cursor_name left_ptr

# Set Desktop Background
feh --bg-fill /home/bclifford/Pictures/wallpapers/red_fox.jpg

# Start compositor
compton -b

# Numlock state save
numlockx &

# Add fonts to path and rehash
xset fp+ /usr/share/fonts/siji
xset fp+ /usr/share/fonts/tewi
xset fp+ /usr/share/fonts/lemon
xset fp+ /usr/share/fonts/stlarch
xset fp+ /usr/share/fonts/uushi
xset fp+ /usr/share/fonts/terminess
xset fp rehash

# Source Xresources
xrdb ~/.Xresources

# Launch Urxvt daemon
urxvtd -f -q -o

# Start Simple X Hotkey Daemon
sxhkd &

# Start Lemonbar
panel &

# Start Window Manager
exec bspwm
