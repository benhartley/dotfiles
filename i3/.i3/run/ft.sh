#! /bin/bash -e

i3-msg 'workspace 2'

[ "$(i3-msg '[title="Portfolio - online portfolio management tool"] focus')" = '[{"success":true}]' ] \
    || i3-msg "exec --no-startup-id chromium --app=\"https://markets.ft.com/data/portfolio/dashboard\""
