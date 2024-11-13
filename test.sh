#!/bin/bash
if [ systemd-detect-virt &> /dev/null ]; then 
	echo "positive"
fi	
