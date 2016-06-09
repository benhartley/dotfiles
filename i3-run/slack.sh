#! /bin/bash -e

i3-msg 'workspace 7'

[ "$(i3-msg '[title="The A.C.T Slack"] focus')" = '[{"success":true}]' ] \
    || i3-msg "exec --no-startup-id chromium --app=\"https://theactslack.slack.com\""
