#! /bin/bash -e

i3-msg 'workspace 5'

[ "$(i3-msg '[title="Google Calendar"] focus')" = '[{"success":true}]' ] \
    || i3-msg "exec --no-startup-id chromium --app=\"https://calendar.google.com/calendar/b/2/r\""
