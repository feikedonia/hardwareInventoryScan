#!/bin/bash
#Copyright (C) 2024 Feike Donia
#
#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License along
#    with this program; if not, write to the Free Software Foundation, Inc.,
#    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

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
