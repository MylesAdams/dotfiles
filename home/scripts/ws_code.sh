#!/bin/bash

i3-msg 'workspace "4:   Code "; append_layout /home/myles/.config/i3/layouts/ws_code.json' &
tilix &
sleep .2
tilix &
sleep .2
emacsclient -c &
sleep .2
emacsclient -c &
