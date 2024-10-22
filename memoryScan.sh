#!/bin/bash
#Copyright 2024 Feike Donia

#name and function
scriptName="memoryScan.sh"
echo "$scriptName wordt uitgevoerd..."

#Check local dependancies
notFound=""

if ! command -v lsmem &> /dev/null; then
	notFound+="lsmem "	#spatie niet vergeten!
fi

if ! command -v dmidecode &> /dev/null; then
	notFound+="dmidecode "
fi

if [ -n "$notFound" ]; then 
	echo "Kan $scriptName niet draaien door missende programma's: $notFound."
	exit 1
fi

# lsmem
lsmem -J > /tmp/hardwareInventoryScan/lsmem.json

