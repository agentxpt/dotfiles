#!/bin/sh

failsafe="xterm -ls -T failsafe -geometry 80x24-0-0"

trap "exec $failsafe" EXIT SIGHUP SIGINT SIGPIPE SIGTERM SIGIO

test -r ~/.Xdefaults  && xrdb ~/.Xdefaults
test -r ~/.Xresources && xrdb ~/.Xresources
test -r ~/.Xmodmap    && xmodmap ~/.Xmodmap

xset b off
xset m 2 5

#feh --bg-max /data/pics/wallpapers/github/octowhite.png
#feh --bg-max /data/pics/wallpapers/trigonometry.jpg
#feh --bg-max /data/pics/wallpapers/fp_is_the_right_way.jpg
#feh --bg-max /data/pics/wallpapers/steampunk2.jpg
feh --bg-fill /data/pics/wallpapers/haskell.png

pgrep urxvtd || urxvtd -f -q -o
pgrep ssh-agent || eval $(ssh-agent) && SSH_ASKPASS=ssh-askpass ssh-add < /dev/null

autocutsel -selection CLIPBOARD -fork &
autocutsel -selection PRIMRARY  -fork &

# Java Swing fix
wmname LG3D

while true; do
    xsetroot -name "$(date +'%d %b %R')"
    sleep 1m
done &

exec dwm
#xmonad
