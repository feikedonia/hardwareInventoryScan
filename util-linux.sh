#!/bin/bash
# Copyright Feike Donia 2024
# GNU GPLv2

script="util-linux.sh"
echo "-> $script wordt uitgevoerd..."

echo "   Programma-afhanklijkheden worden gecheckt..."
if ! command -v lscpu &> /dev/null; then
	#try to install
	echo "!  De programma-bundel util-linux is niet geïnstalleerd."
	echo "   Automatische installatie wordt geprobeerd..."
	if command -v apt &> /dev/null; then
		apt install -y util-linux
	elif command -v dnf &> /dev/null; then
		dnf in -y util-linux
	elif command -v pacman &> /dev/null; then
		pacman -S --noconfirm util-linux
	else
		echo "!  De automatische installatie is gefaald."
		exit 1
	fi
fi

echo "   De systeemtaal wordt gecheckt..."
if [ "$LANG" != "en_US.UTF-8" ]; then
	echo "!  De taal is niet ingesteld op Engels, maar op $LANG."
	echo "!  Vraag uw beheerder of dit wenselijk is." 
	echo "!  Als u het niet zeker weet, kies nee (N)."
	read -p "-> Wilt u toch doorgaan? (y/N): " -n 1 -r
	echo 
	if ! [[ $REPLY =~ ^[Yy]$ ]]; then
		echo "!  Programma beëindigen..."
		exit 1
	fi
fi

#lscpu
lscpu -J > /tmp/hardwareScan/lscpu.json

#Check the memory
lsmem -J > /tmp/hardwareScan/lsmem.json
exit 0
