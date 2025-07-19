#!/bin/sh
chars=", %:"
if [ $(acpi -b | awk 'NR==1{print$3}') = 'Not' ] ; then
	chargestate=$(acpi -b | awk 'NR==2{print$3}' | cut -c 1-3)
	charge=$(acpi -b | awk 'NR==1{print$5}' | cut -c 1-4 | sed "s/[$chars]//g")
	bat=$(acpi -b | awk 'NR==2{print$2}' | cut -c 1-4 | sed "s/[$chars]//g")
else
	chargestate=$(acpi -b | awk 'NR==1{print$3}' | cut -c 1-3)
	charge=$(acpi -b | awk 'NR==1{print$4}' | cut -c 1-4 | sed "s/[$chars]//g")
	bat=$(acpi -b | awk 'NR==1{print$2}' | cut -c 1-4 | sed "s/[$chars]//g")

fi	
if [ "$bat" = '0' ] ; then
	if [ "$chargestate" = 'Cha' ] && [ "$charge" -gt 80 ] ; then
		echo "Battery fully charged"
	elif [ "$chargestate" = "Cha" ]; then
		echo $charge% Charging
	else
		echo $charge%
	fi
else
	if [ "$chargestate" = 'Ful' ] && [ "$charge" -gt 80 ] ; then
		echo "Battery fully charged"
	elif [ "$chargestate" = "Cha" ]; then
		echo $charge% Charging
	else
		echo $charge%
	fi	
fi
