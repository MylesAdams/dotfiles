#!/bin/bash
while [ "$select" != "CANCEL" -a "$select" != "LOGOUT" -a "$select" != "POWEROFF" -a "$select" != "REBOOT" ];
do
	select=$(echo -e 'CANCEL\nLOGOUT\nPOWEROFF\nREBOOT' | dmenu -nb '#151515' -nf '#999999' -sb '#f00060' -sf '#000000' -fn 'DejaVu Sans Mono-15' -i -p "Do you really want to exit i3?")
	[ -z "$select" ] && exit 0
done
[ "$select" = "CANCEL" ] && exit 0
[ "$select" = "LOGOUT" ] && i3-msg exit
[ "$select" = "POWEROFF" ] && poweroff
[ "$select" = "REBOOT" ] && reboot

