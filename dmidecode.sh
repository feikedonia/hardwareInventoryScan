#!/bin/bash
#Copyright (C) 2024 Feike Donia
#GPL-2.0-or-later

#name and function
scriptName="dmidecode.sh"
echo "$scriptName wordt uitgevoerd..."

#Check dependancies
if ! command -v dmidecode &> /dev/null; then
	echo "Kan het programma dmidecode niet vinden."
	exit 1
fi

if ! command -v jc &> /dev/null; then
	#try to install 
	echo "Het programma jc is niet geïnstalleerd."
	echo "Automatische installatie wordt geprobeerd..."

	if command -v apt &> /dev/null; then
		apt update && apt install -y jc
	elif command -v dnf &> /dev/null; then
		dnf in -y jc
	elif command -v pacman &> /dev/null; then
		pacman -S --noconfirm jc
	else
		echo "De automatische installatie is gefaald."
		exit 1
	fi
fi

dmidecode -t memory | jc --dmidecode -p > /tmp/hardwareScan/dmidecodeMemory.json

exit 0

