killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar xbar-i3wm
