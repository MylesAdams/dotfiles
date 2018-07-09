#!/bin/bash

i3-msg 'workspace "3:   Term "; append_layout /home/myles/.config/i3/layouts/ws_term.json' &
sleep .2
tilix -e "gotop -m" &
sleep .2
tilix -e calcurse &
sleep .2
tilix -e ranger &
sleep .2
tilix &
sleep .2
tilix &
sleep .2
tilix &
