#! /bin/bash -e

i3-msg 'workspace 7'

[ "$(i3-msg '[title="PHDV Slack"] focus')" = '[{"success":true}]' ] \
    || i3-msg "exec --no-startup-id chromium --app=\"https://pizzahutuk.slack.com\""
