#! /bin/bash -e

i3-msg 'workspace 7'

[ "$(i3-msg '[title="Team Eureka Slack"] focus')" = '[{"success":true}]' ] \
    || i3-msg "exec --no-startup-id chromium --app=\"https://team-eurekahq.slack.com\""
