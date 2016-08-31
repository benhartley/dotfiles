#! /bin/bash -e

i3-msg 'workspace 7'

[ "$(i3-msg '[title="New Look Digital Slack"] focus')" = '[{"success":true}]' ] \
    || i3-msg "exec --no-startup-id chromium --app=\"https://newlookdigital.slack.com\""
