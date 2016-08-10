xrdb -merge ~/.Xresources
xss-lock -- i3lock -c 0f0f0f &
setxkbmap -option 'caps:ctrl_modifier' &
xcape -e 'Caps_Lock=Escape' &
unclutter &
redshift &
exec i3
