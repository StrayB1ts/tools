#!/bin/sh
chars=", %"
chargestate=$(acpi -b | awk 'NR==1{print$3}' | cut -c 1-3)
charge=$(acpi -b | awk 'NR==1{print$4}' | cut -c 1-4 | sed "s/[$chars]//g")
if [ "$chargestate" = 'Cha' ] && [ "$charge" -gt 80 ] ; then
	echo "Battery fully charged"
elif [ "$chargestate" = "Cha" ]; then
	echo $charge% Charging
else
	echo $charge%
fi	
