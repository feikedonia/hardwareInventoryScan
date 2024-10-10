#!/bin/bash
#copyright 2024 Feike Donia

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
	echo "Kan benodigde programma's niet vinden: $notFound."
	exit 1
fi

#Check language variable
if [ "$LANG" != "en_US.UTF-8" ]; then
	echo "De taal is niet ingesteld op Engels (en_US.UTF-8)."
	read -p "Wilt u toch doorgaan? (y/N)" -n 1 -r 	#-n 1 check one charactor
	echo 
	if ! [[ $REPLY =~ ^[Yy]$ ]]; then
		echo "Programma beëindigen…"
		exit 1
	fi
fi
	
#Make temp directory for the outputs to go to
mkdir -p /tmp/hardwareInventoryScan/

#Source the next script
source ~/hardwareInventoryScan/processorScan.sh
