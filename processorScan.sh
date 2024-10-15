#!/bin/bash
# Copyright 2024 Feike Donia

#name and function
scriptName="processorScan.sh"
echo "$scriptName wordt uitgevoerd..."

#Check local dependancies
notFound=""

if ! [ which lscpu &> /dev/null ]; then
	notFound+="lscpu "	#spatie niet vergeten!
fi

if [ -n "$notFound" ]; then 
	echo "Kan $scriptName niet draaien door missende programma's: $notFound."
	exit 1
fi

#lscpu
lscpu -J > /tmp/hardwareInventoryScan/lscpu.json #does overwrite, if already exists!
exit 0
