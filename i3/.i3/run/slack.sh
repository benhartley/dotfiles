#! /bin/bash -e

i3-msg 'workspace 4'

[ "$(i3-msg '[title="Slack"] focus')" = '[{"success":true}]' ] || i3-msg "exec --no-startup-id chromium --app=\"https://mettlebank.slack.com\""

# [ "$(i3-msg '[title="Simba Sleep Slack"] focus')" = '[{"success":true}]' ] || i3-msg "exec --no-startup-id chromium --app=\"https://simbasleep.slack.com\""
# [ "$(i3-msg '[title="DisconnectedFactory Slack"] focus')" = '[{"success":true}]' ] || i3-msg "exec --no-startup-id chromium --app=\"https://disconnectedfactory.slack.com\""
# [ "$(i3-msg '[title="Team Eureka Slack"] focus')" = '[{"success":true}]' ] || i3-msg "exec --no-startup-id chromium --app=\"https://team-eurekahq.slack.com\""
