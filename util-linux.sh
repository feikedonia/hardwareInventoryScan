#!/bin/bash
#Copyright (C) 2024 Feike Donia
#GPL-2.0-or-later

#name and function
scriptName="dmidecode.sh"
echo "$scriptName wordt uitgevoerd..."

#name and function
scriptName="util-linux.sh"
echo "$scriptName wordt uitgevoerd..."

#Check dependancies
if ! command -v lscpu &> /dev/null; then
	echo "Kan de programma-bundel util-linux niet vinden."
	exit 1
fi

#Check the cpu
lscpu -J > /tmp/hardwareScan/lscpu.json

#Check the memory
lsmem -J > /tmp/hardwareScan/lsmem.json
exit 0
