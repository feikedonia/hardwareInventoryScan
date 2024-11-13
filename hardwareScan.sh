#!/bin/bash
#Copyright (C) 2024 Feike Donia
#GPL-2.0-or-later

#name and function
scriptName="hardwareScan.sh"
echo "$scriptName wordt uitgevoerd..."

#executing checks
echo "Alles checken..."

#Check if run as root
if [ "$(id -u)" != 0 ]; then 
	echo "Dit script heeft root(admin) rechten nodig om te draaien."
	echo "Gelieve dit script te heropenen in root shell:"
	echo "'su' of 'sudo ./hardwareScan'."
	exit 1
fi

#Check if run in the correct directory, otherwise change into it
if [ "$(pwd)" != "$HOME/hardwareInventoryScan" ]; then
	if ! [ -d "$HOME/hardwareInventoryScan" ]; then
		echo "Kan de hardwareInventoryScan map niet vinden."
		exit 1
	fi
	cd "$HOME/hardwareInventoryScan"
fi
		
#Make temp directory for the outputs to go to
echo "Mappen aanmaken..."
mkdir -p /tmp/hardwareScan/

#Start the next script, without preserved variables
./util-linux.sh

./dmidecode.sh

#Finish
echo "Uw machine is gescand; de resultaten zijn te vinden in /tmp/hardwareScan."
exit 0 
