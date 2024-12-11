#!/bin/bash
# Copyright Feike Donia 2024
# GNU LGPLv3

script="update.sh"
echo "-> $script wordt uitgevoerd..."

#Update the system, before running the scans
echo "   Automatisch updaten..."
if command -v apt &> /dev/null; then
	echo "   Debian / Ubuntu gededecteerd, APT wordt geüpdatet..."
	apt update && apt upgrade -y
	#Make timestamp or update timestamp
	echo "$(date +%s)" > /tmp/hardwareScan/timestamp.txt
	
elif command -v dnf &> /dev/null; then
	echo "   RHEL / CentOS / Fedora gededecteerd, DNF wordt geüpdatet..."
	dnf check-update && dnf upgrade -y
	#Make timestamp or update timestamp
	echo "$(date +%s)" > /tmp/hardwareScan/timestamp.txt
	
elif command -v pacman &> /dev/null; then
	echo "   Arch linux gededecteerd, Pacman wordt geüpdatet..."
	pacman -Syyu --noconfirm
	#Make timestamp or update timestamp
	echo "$(date +%s)" > /tmp/hardwareScan/timestamp.txt
	
else
	echo "!  Automatisch updaten mislukt."
	exit 1
fi	
