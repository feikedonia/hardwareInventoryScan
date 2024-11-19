#!/bin/bash
#Copyright (C) 2024 Feike Donia
#GPL-2.0-or-later

#name and function
scriptName="update.sh"
echo ":::$scriptName wordt uitgevoerd..."

#Update the system, before running the scans
echo ":::Automatisch updaten..."
if command -v apt &> /dev/null; then
	echo ":::Debian / Ubuntu gededecteerd, APT wordt geüpdatet..."
	apt update && apt upgrade -y
	#Make timestamp or update timestamp
	echo "$(date +%s)" > /tmp/hardwareScan/timestamp.txt
	
elif command -v dnf &> /dev/null; then
	echo ":::RHEL / CentOS / Fedora gededecteerd, DNF wordt geüpdatet..."
	dnf check-update && dnf upgrade -y
	#Make timestamp or update timestamp
	echo "$(date +%s)" > /tmp/hardwareScan/timestamp.txt
	
elif command -v pacman &> /dev/null; then
	echo ":::Arch linux gededecteerd, Pacman wordt geüpdatet..."
	pacman -Syyu --noconfirm
	#Make timestamp or update timestamp
	echo "$(date +%s)" > /tmp/hardwareScan/timestamp.txt
	
else
	echo "!::Automatisch updaten mislukt."
	exit 1
fi	
