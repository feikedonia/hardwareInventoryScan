#!/bin/bash
#Copyright (C) 2024 Feike Donia
#
#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License along
#    with this program; if not, write to the Free Software Foundation, Inc.,
#    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

#name and function
scriptName="hardwareScan.sh"
echo "$scriptName wordt uitgevoerd..."

#executing checks
echo "Alles checken..."

#Check if run as root
if [ "$(id -u)" != 0 ]; then 
	echo "Dit script heeft root(admin) rechten nodig om te draaien."
	echo "Gelieve dit script te heropenen in root shell:"
	echo "'su' of 'sudo su'"
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
	
#Check language variable
if [ "$LANG" != "en_US.UTF-8" ]; then
	echo "De taal is niet ingesteld op Engels, maar op $LANG."
	echo "Vraag uw beheerder of dit wenselijk is." 
	echo "Als u het niet zeker weet, kies nee (N)."
	read -p "Wilt u toch doorgaan? (y/N)" -n 1 -r 	#-n 1 check one charactor
	echo 
	if ! [[ $REPLY =~ ^[Yy]$ ]]; then
		echo "Programma beëindigen..."
		exit 1
	fi
fi
	
#Make temp directory for the outputs to go to
echo "Mappen aanmaken..."
mkdir -p /tmp/hardwareScan/

#Start the next script, without preserved variables
./processorScan.sh

./memoryScan.sh
