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
	
#Check dependancies
notFound=""

if ! which dmidecode &> /dev/null; then
	notFound+="dmidecode "	#spatie niet vergeten!
fi

#if ! which foo &> /dev/null; then
#	notFound+="foo "	#spatie niet vergeten!
#fi

if [ -n "$notFound" ]; then 
	echo "Kan benodigde programma's niet vinden: $notFound."
	exit 1
fi
	
#Make temp directory for the outputs to go to
mkdir -p /tmp/hardwareInventoryScan/

#Source the next script
