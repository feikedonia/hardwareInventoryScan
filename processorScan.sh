#!/bin/bash
# Copyright 2024 Feike Donia

scriptName="processorScan.sh"

#Check local dependancies
#notFound=""
#
#if ! which dmidecode &> /dev/null; then
#	notFound+="dmidecode "	#spatie niet vergeten!
#fi

#if [ -n "$notFound" ]; then 
#	echo "Kan $scriptName niet draaien door missende programma's: $notFound."
#	exit 1
#fi

#lscpu
lscpu -J > /tmp/hardwareInventoryScan/lscpu.json #does overwrite, if already exists!
