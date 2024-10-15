#!/bin/bash
#copyright 2024 Feike Donia

#name and function
scriptName="hardwareInventoryScan"
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
mkdir -p /tmp/hardwareInventoryScan/

#Start the next script, without preserved variables
./processorScan.sh
