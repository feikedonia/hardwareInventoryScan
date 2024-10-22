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

