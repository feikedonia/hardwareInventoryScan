#!/bin/bash
#copyright 2024 Feike Donia

scriptName="hardwareInventoryScan"

#Check if run as root
if [ "$(id -u)" != 0 ]; then 
	echo "Dit script heeft root(admin) rechten nodig om te draaien."
	echo "Gelieve dit script te heropenen in root shell:"
	echo "'su' of 'sudo su'"
	exit 1
fi
	
#Check if pwd = /root
if [ "$HOME" != "/root" ]; then
	echo "Dit script is heeft een onjuiste \$HOME."
	exit 1
fi
	
#Check global dependancies
notFound=""

#if ! which foo &> /dev/null; then
#	notFound+="foo "	#spatie niet vergeten!
#fi

if [ -n "$notFound" ]; then 
	echo "Kan $scriptName niet draaien door missende programma's: $notFound."
	exit 1

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

#Source the next script
source ~/hardwareInventoryScan/processorScan.sh

#End of the program
echo "Einde van het programma, er is nog niet verstuurd naar de server."
exit 
