#!/bin/bash
#Copyright (C) 2024 Feike Donia
#GPL-2.0-or-later
clear
scriptName="hardwareScan.sh"
echo "-> $scriptName wordt uitgevoerd..."

echo "   Check of script wordt uitgevoerd als root..."
if [ "$(id -u)" != 0 ]; then 
	echo "!  Dit script heeft root(admin) rechten nodig om te draaien."
	echo "!  Gelieve dit script te heropenen in root shell:"
	echo "!  'su' of 'sudo ./hardwareScan'."
	exit 1
fi

echo "   Check of u in de juiste map staat..."
if [ "$(pwd)" != "$HOME/hardwareInventoryScan" ]; then
	if ! [ -d "$HOME/hardwareInventoryScan" ]; then
		echo "!  Kan de hardwareInventoryScan map niet vinden."
		exit 1
	fi
	cd "$HOME/hardwareInventoryScan"
fi
	
#Make temp directory for the outputs to go to
echo "   Mappen aanmaken..."
mkdir -p /tmp/hardwareScan/

#Check if updated recently
echo "   Check of het systeem recent in geüpdatet..."
checkFile="/tmp/hardwareScan/timestamp.txt"

if [ -f "$checkFile" ]; then
	lastUpdate=$(cat "$checkFile")
	if [ $lastUpdate < [ $(date +%s) - 259200 ] ]; then
		#if older then 3 days; then update.sh
		./update.sh
	else
		echo "   Systeem is recent geüpdatet."
	fi
else
	echo "   Systeem is recent geüpdatet."
fi

#Start the next script, without preserved variables
./util-linux.sh

./dmidecode.sh

#Finish
echo ""
echo "-> Uw machine is gescand; de resultaten zijn te vinden in /tmp/hardwareScan."
echo ""
exit 0 
