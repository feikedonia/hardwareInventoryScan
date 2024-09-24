#!/bin/bash
# Copyright 2024 Feike Donia
# Hardware Inventory Scan
version=0.1.0
server=https://hi.itmagazijn.nl
key="PLACEHOLDER"


echo "Hardware Inventory Scan"
echo "Copyright 2024 Feike Donia"
echo " "
echo "Type      : Client Downloader"
echo "Versie    : $version"

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

