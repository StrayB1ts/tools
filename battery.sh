#!/bin/sh
chars=",%"
export DISPLAY=:0
PERCENT=$(acpi -b | awk 'NR==1{print$4}' | cut -c 1-3 | sed "s/[$chars]//g")
 if [ "$PERCENT" -lt "50" ];
 then
	 if [ "$PERCENT" -lt "25" ];
	 then
		 notify-send -u critical "Battery" "Battery below 25%"
	 else
		 notify-send "Battery" "Battery is below 50%"
	 fi
 fi
