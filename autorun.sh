#!/bin/sh

## run (only once) processes which spawn with the same name
run() {
   if (command -v "$1" && ! pgrep "$1"); then
     "$@"& 
   fi
}

## run (only once) processes which spawn with different name
if (command -v gnome-keyring-daemon && ! pgrep gnome-keyring-d); then
    gnome-keyring-daemon --daemonize --login &
fi
if (command -v start-pulseaudio-x11 && ! pgrep pulseaudio); then
    start-pulseaudio-x11 &
fi
if (command -v /usr/lib/mate-polkit/polkit-mate-authentication-agent-1 && ! pgrep polkit-mate-aut) ; then
    /usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
fi
if (command -v  mate-power-manager && ! pgrep mate-power-man) ; then
    mate-power-manager &
fi


run mate-power-manager
run start-pulseaudio-x11
run /usr/bin/gnome-keyring-daemon --start --components=ssh
run /usr/libexec/mate-settings-daemon
run nm-applet
run /usr/libexec/polkit-mate-authentication-agent-1
run mate-screensaver
run /usr/bin/gnome-keyring-daemon --start --components=secrets
run xdg-user-dirs-update
run xdg-user-dirs-gtk-update
run volumeicon
run picom