xrdb -merge ~/.Xresources
xss-lock -- i3lock -c 0f0f0f &
xcape -e "Caps_Lock=Escape" &
compton &
redshift &
syndaemon -d -i 0.5 &
exec i3
