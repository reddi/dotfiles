#!/bin/sh

set_kbd_map() {
    xset r rate 200 40
        setxkbmap -model macbook -layout us,ru -variant winkeys -option grp:caps_toggle,grp_led:caps,compose:ralt
}
export -f set_kbd_map

xrdb -merge ~/.Xdefaults

urxvtd -q -f -o

set_kbd_map

xmodmap ~/.Xmodmap

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

devmon &> /tmp/devmon.log &

killall gpg-agent
eval $(gpg-agent --daemon) &

exec dbus-launch --exit-with-session awesome
