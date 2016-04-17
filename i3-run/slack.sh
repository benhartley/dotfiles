#! /bin/bash -e

i3-msg 'workspace 7'

[ "$(i3-msg '[title="BBC Three Slack"] focus')" = '[{"success":true}]' ] \
    || i3-msg "exec --no-startup-id chromium --app=\"https://bbcthree.slack.com\""
