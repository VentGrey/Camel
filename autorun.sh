#!/bin/sh

## run (only once) processes which spawn with the same name
run() {
   if (command -v "$1" && ! pgrep "$1"); then
     "$@"& 
   fi
}

## run (only once) processes which spawn with different name
if (command -v start-pulseaudio-x11 && ! pgrep pulseaudio); then
    start-pulseaudio-x11 &
fi
if (command -v /usr/lib/mate-polkit/polkit-mate-authentication-agent-1 && ! pgrep polkit-mate-aut) ; then
    /usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
fi
if (command -v  mate-power-manager && ! pgrep mate-power-man) ; then
    mate-power-manager &
fi

run dbus-update-activation-environment --all
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh | sed 's/^(.*)/export \1/g')
run start-pulseaudio-x11
run /usr/libexec/mate-settings-daemon
run nm-applet
run mate-screensaver
run xdg-user-dirs-update
run xdg-user-dirs-gtk-update
run volumeicon
run picom --experimental-backends
run xss-lock --transfer-sleep-lock -- i3lock --color=000000 --nofork