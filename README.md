This is a catch-all repo for tools I may create to help automate things. If any are particularly popular or I find them super cool, then I may move them to their own repo upon completion. All tools are licensed with the "Unlicense license" so feel free to modify/fork/whatever any of the tools to suit your needs :)

# stmake.sh
**Description**: A simple bash script that simplifies the process of flashing new firmware to stm microcontrollers via an st-link.

**Usage**: simply call the script and provide the bin file `stmake.sh <example.bin>` and if there any devices recognized by your st-link it will flash it! (Make sure to look at the reference manual for the chip and change the script accordingly so it writes to the proper address)

**Known working configs**: I can currently only confirm that it works with stm32f411c devices via an st-link v2 however they are all very similar so it should work with little to no modification. I may update this as I gain more access to other devices
|Board|Flasher|Status|
| --- | --- | --- |
|WeAct BlackPill v3.0| ST-Link v2|✔️Working|

**Notes**: this script requires stlink-tools to be installed so do that first otherwise the script will not work. Also, the script will need to be run with sudo unless you setup the udev rules properly

**Setting up udev**:
   1. clone the official stlink-tools repo from https://github.com/texane/stlink
   2. cd into the main directory and run `make`
   3. once the compilation is finished you can copy over the rules from config/udev/rules with the command `sudo cp config/udev/rules.d/49-stlinkv /etc/udev/rules.d`
   4. finally, you can restart the udev rules et voila! no sudo needed (on debian based systems this will be the command `sudo service udev restart`
# battery.sh + bat.sh
**Description**: Simple bash scripts that query and return your battery percentage via acpi. battery.sh gives notifications via notify-send when the percentage is below 50% and then another notification if it is below 25% and is most useful when used in conjunction with a cronjob. bat.sh queries your batterie(s) and echoes whether it is fully charged (above 80%), the percentage + charging status, or if not plugged in it will simply echo the charge, and should work for both barrel jack and type-c charging on laptops.

**Usage**: I personally use battery.sh with a cron job every 10 minutes for notifications and bat.sh to display my battery percentage in the tmux bar. However they can also be used to display the chargestate and charge to stdin.
