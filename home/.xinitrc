xrandr --output HDMI-0 --mode 1920x1080 --rate 60 --pos 0x0 --rotate normal
xrandr --output DP-4 --primary --mode 2560x1440 --rate 179.88 --right-of HDMI-0 --rotate normal
xrandr --output DP-2 --mode 1920x1080 --rate 165 --right-of DP-4 --rotate normal
clipmenud &
while clipnotify -s clipboard; do
    xclip -o -selection clipboard | xclip -i -selection clipboard -loops 0
done &
sh ~/scripts/capslock-fix.sh
~/.config/dwm/autostart.sh &
exec dwm














