#! /bin/bash -e

i3-msg 'workspace 2'

[ "$(i3-msg '[title="Kraken live chart"] focus')" = '[{"success":true}]' ] \
    || i3-msg "exec --no-startup-id chromium --app=\"https://trade.kraken.com\""
