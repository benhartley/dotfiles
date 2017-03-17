#! /bin/bash -e

i3-msg 'workspace 5'

[ "$(i3-msg '[title="Remember The Milk"] focus')" = '[{"success":true}]' ] \
    || i3-msg "exec --no-startup-id chromium --app=\"https://rememberthemilk.com\""
