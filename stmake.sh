#!/bin/sh
numargs=$#
if [ ${numargs} -gt 1 ]; then
	echo "too many arguments! call with no arguments to be asked what file to use or call with the bin file you want to use"
	exit 1 <&2
elif [ ${numargs} -eq 1 ]; then
	st-flash --reset write $1 0x8000000
	exit 0 >&2
else
	read -p "Enter the filename (should be a .bin file): " filename
	st-flash --reset write $filename 0x8000000
	exit 0 >&2
fi
