xrdb -merge ~/.Xresources
xss-lock -- i3lock -c 000000 &
setxkbmap -option 'caps:ctrl_modifier' &
xcape -e 'Caps_Lock=Escape' &
unclutter &
redshift &
exec i3
