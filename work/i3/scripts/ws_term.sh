#!/bin/bash

i3-msg 'workspace "3:   Term "; append_layout ~/.config/i3/layouts/ws_term.json'
#i3-msg 'workspace 7; append_layout ~/.config/i3/layouts/ws_term.json'
sleep .1
tilix -e "gotop -m" &
sleep .1
tilix &
sleep .1
tilix &
sleep .1
tilix &
sleep .1
tilix &
