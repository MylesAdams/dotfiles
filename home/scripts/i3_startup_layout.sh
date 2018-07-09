#!/bin/bash

sleep 5
$HOME/scripts/ws_code.sh

sleep .3
$HOME/scripts/ws_term.sh

sleep .3
$HOME/scripts/remove_urgent.sh
