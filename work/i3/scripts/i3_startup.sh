#!/bin/bash

sleep 5
$HOME/scripts/ws_code.sh
$HOME/scripts/ws_term.sh

i3-msg "exec --no-startup-id chromium-browser"
i3-msg "exec --no-startup-id thunderbird"
i3-msg "exec --no-startup-id spotify"

sleep 3
$HOME/scripts/remove_urgent.sh
