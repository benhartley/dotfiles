xrdb -merge ~/.Xresources
xss-lock -- /usr/bin/slock &
setxkbmap -option 'caps:ctrl_modifier' &
xcape -e 'Caps_Lock=Escape' &
exec i3
