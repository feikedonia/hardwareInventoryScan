#!/bin/bash

# (C) Feike Donia 2024, BSD-clause-2
# Processor scanner

#Check if run as root
if [ "$(id -u)" -eq 0 ]; then
	echo "U probeerde dit script als root(admin) te openen."
	echo "Gelieve dit script te openen als gewone gebruiker."
	exit 1 
fi

#Check if dmidecode exists
if ! which dmidecode &> /dev/null; then
	echo "Het programma dmidecode was niet gevonden."
	exit 1 
fi

#Make a directory ~/.tmp/hardwareScan
#mkdir -p ~/.tmp/hardwareScan/cpuScan

#Scan the cpu
lscpu -J > ~/.tmp/hardwareScan/cpuScan/lscpu.json



