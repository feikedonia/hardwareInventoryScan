#!/bin/bash
#Copyright 2024 Feike Donia

#name and function
scriptName="memoryScan.sh"
echo "$scriptName wordt uitgevoerd..."

#Check local dependancies
notFound=""

if ! command -v jc &> /dev/null; then
	notFound+="jc "
	fi
	

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

# lsmem , tells you quantity of memory, and if removable
lsmem -J > /tmp/hardwareInventoryScan/lsmem.json

# dmidecode -t memory , tells the speed of the memory
dmidecode -t memory | jc --dmidecode -p > /tmp/hardwareInventoryScan/dmidecodeMemory.json
