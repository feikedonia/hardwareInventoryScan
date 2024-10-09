
#!/bin/bash
# Copyright 2024 Feike Donia
# Hardware Inventory Scan

# Check to run as root(admin), otherwise fail
if [ "$(id -u)" != 0 ]; then
	echo "Dit script heeft root(admin) permissies nodig om te draaien."
	echo "Gelieve dit script te heropenen met sudo of een root shell."
	exit 1 
fi
#Check the dependancies

notFount="" 

if ! which dmidecode &> /dev/null; then   # if curl does not exist, add curl to the notFount variable
  notFount+="dmidecode "
fi

#Check for a program, foo is a placeholder
#if ! which foo &> /dev/null; then   # if curl does not exist, add curl to the notFount variable
#  notFount+="foo "
#fi 

if [ -n "$notFount" ]; then   # check if notFount is not empty
  echo "Kan benodigde bestand(en) niet vinden: $notFount"
fi 

#Make a temp dir.
mkdir -p ~/.tmp/hardwarescan/

#Test to find a bug:
test=$(pwd)
echo '$test' 
source processorScan.sh
