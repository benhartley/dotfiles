#! /bin/bash -e

i3-msg 'workspace 6'

[ "$(i3-msg '[title="Trello"] focus')" = '[{"success":true}]' ] \
    || i3-msg "exec --no-startup-id chromium --app=\"https://trello.com\""
