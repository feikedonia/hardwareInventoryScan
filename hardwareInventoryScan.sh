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

if ! which vim &> /dev/null; then   # if curl does not exist, add curl to the notFount variable
  notFount+="vim "
fi 


if ! which tofu &> /dev/null; then   # if curl does not exist, add curl to the notFount variable
  notFount+="tofu "
fi 

if [ -n "$notFount" ]; then   # check if notFount is not empty
  echo "Kan benodigde bestand(en) niet vinden: $notFount"
fi 

