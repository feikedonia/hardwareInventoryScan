#!/bin/bash
# Copyright Feike Donia 2024
# GNU LGPLv3

script="dmidecode.sh"
echo "-> $script wordt uitgevoerd..."

echo "   Programma-afhankelijkheden worden gecheckt..."
if ! command -v dmidecode &> /dev/null; then
	echo "!  Kan het programma dmidecode niet vinden."
	exit 1
fi

if ! command -v jc &> /dev/null; then
	#try to install 
	echo "!  Het programma jc is niet geïnstalleerd."
	echo "   Automatische installatie wordt geprobeerd..."

	if command -v apt &> /dev/null; then
		apt install -y jc
	elif command -v dnf &> /dev/null; then
		dnf in -y jc
	elif command -v pacman &> /dev/null; then
		pacman -S --noconfirm jc
	else
		echo "!  De automatische installatie is gefaald."
		exit 1
	fi
fi

#dmidecode
#loop through types 0 to 4
for i in {0..4}; do
	dmidecode -t $i | jc --pritty --dmidecode > /tmp/hardwareScan/dmidecode$i.json
done

loop for types 16 and 17
for i in {16..17}; do
	dmidecode -t $i | jc --pritty --dmidecode > /tmp/hardwareScan/dmidecode$i.json
done

exit 0
