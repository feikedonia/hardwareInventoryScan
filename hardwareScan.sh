#!/bin/bash
# Copyright Feike Donia 2024
# GNU LGPLv3

clear
script="hardwareInventory.sh"
echo "-> Executing $script"


# Function to check executing user is root.
echo "   Checking script is running as root."

# Funtion to check uid is 0, because root has uid 0.
if [ "$(id -u)" != 0 ]; then
	echo "!  $script requires root privilege."
	exit 1
fi


# Check working directory
echo "   Checking working direcory."

# Check working directory matches the expected directory
if [ "$(pwd)" != "$HOME/hardwareInventoryScan" ]; then

    if ! [ -d "$HOME/hardwareInventoryScan" ]; then
        echo "!  hardwareInventoryScan has not been found. Exiting."
        exit 1
    fi

    # Navigate to the correct directory
    cd "$HOME/hardwareInventoryScan" || {
        echo "!  Cannot open hardwareInventoryScan. Exiting.";
        exit 1;
    }
fi


# Making directories to output the scan data, and store global variables
echo "   Making directories."
mkdir -p /tmp/hardwareScan/
touch /tmp/hardwareScan/.packagemanager.var


# Read global variable, and if empty call packagemanager function
packagemanager=$(cat /tmp/hardwareScan/.packagemanager.var)



# Global variable for package manager.
echo "   Determining package manager for automatic dependency resolution."

packagemanager=""

if command -v apt &> /dev/null; then
	packagemanager="apt"

elif command -v dnf &> /dev/null; then
	packagemanager="dnf"

elif command -v pacman &> /dev/null; then
	packagemanager="pacman"

else
	echo "!  No supported package manager found."
	echo "!  Proceed without automatic dependancy resolution?"
	read -p "-> Proceed anyway? (y/N): " -n 1 -r
	echo
	if ! [ $REPLY =~ ^[Yy]$ ]; then
		echo "!  Exiting."
	exit 1
	fi
fi






#Start the next script, without preserved variables
## Opeenvolgende scripts moeten worden uitgevoerd met behoud van globale variabelen.
./util-linux.sh

./dmidecode.sh

#Finish
echo ""
echo "-> The machine has been scanned; the results are at /tmp/hardwareScan."
echo ""
exit 0 
