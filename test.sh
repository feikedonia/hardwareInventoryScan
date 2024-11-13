#!/bin/bash
if [ "$(systemd-detect-virt)" != "none" ]; then
	echo "virtual-machine"
else
	echo "no virtual-machine"
fi
exit 0
