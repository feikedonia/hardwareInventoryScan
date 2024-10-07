#!/bin/bash

# Copyright 2024 Feike Donia
# Processor scanner

#Check if dmidecode exists
if ! which dmidecode &> /dev/null; then
	echo "Het programma dmidecode was niet gevonden."
	exit 1 
fi

#Make a directory ~/.tmp/hardwareScan
#mkdir -p ~/.tmp/hardwareScan/cpuScan

#Scan the cpu
lscpu -J > ~/.tmp/hardwareScan/cpuScan/lscpu.json



