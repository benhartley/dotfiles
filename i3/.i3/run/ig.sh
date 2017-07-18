#! /bin/bash -e

i3-msg 'workspace 2'

[ "$(i3-msg '[title="IG Trading Platform"] focus')" = '[{"success":true}]' ] \
    || i3-msg "exec --no-startup-id chromium --app=\"https://deal.ig.com/wtp\""
