#!/bin/bash
# Copyright 2024 Feike Donia
# Hardware Inventory Scan

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

