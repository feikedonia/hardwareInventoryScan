#!/bin/bash
#Copyright (C) 2024 Feike Donia
#GPL-2.0-or-later

#name and function
scriptName="util-linux.sh"
echo "$scriptName wordt uitgevoerd..."

#Check dependancies
if ! command -v lscpu &> /dev/null; then
	#try to install
	echo "De programma-bundel util-linux is niet geïnstalleerd."
	echo "Automatische installatie wordt geprobeerd..."

	if command -v apt &> /dev/null; then
			apt update && apt install -y util-linux
		elif command -v dnf &> /dev/null; then
			dnf in -y util-linux
		elif command -v pacman &> /dev/null; then
			pacman -S --noconfirm util-linux
		else
			echo "De automatische installatie is gefaald."
			exit 1
		fi

#Check the cpu
lscpu -J > /tmp/hardwareScan/lscpu.json

#Check the memory
lsmem -J > /tmp/hardwareScan/lsmem.json
exit 0
