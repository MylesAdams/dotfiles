#!/bin/bash

i3-msg 'workspace "4:   Code "'
sleep .1
emacsclient -c &
sleep .1
emacsclient -c &
sleep 1
