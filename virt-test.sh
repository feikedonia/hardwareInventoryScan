#!/bin/bash
#Copyright (C) 2024 Feike Donia
#GPL-2.0-or-later

#name and function
scriptName="virt-test.sh"
echo "$scriptName wordt uitgevoerd..."

#get type of virtualization
virt_type=$(systemd-detect-virt)

#check if output in not 'none'
if [ "$virt_type" != "none" ]; then
	echo "$virt_type" > /tmp/hardwareScan/virt_type.txt
fi
exit 0
