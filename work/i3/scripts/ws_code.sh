#!/bin/bash

i3-msg 'workspace "4:   Code "'
emacsclient -c &
sleep .1
emacsclient -c &
