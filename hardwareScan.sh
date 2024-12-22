#!/bin/bash
# Copyright Feike Donia 2024
# GNU LGPLv3

clear
script="hardwareInventory.sh"
echo "-> Executing $script"


# Functie om te controleren of het script als root wordt uitgevoerd
echo "   Check of het script als root wordt uitgevoerd..."

# Controleer of de user ID (uid) niet gelijk is aan 0 (root heeft uid 0)
if [ "$(id -u)" != 0 ]; then
	echo "!  HardwareScan heeft root(admin) rechten nodig."
	echo "!  Voer het script opnieuw uit met het commando:"
	echo "!  sudo ./hardwareScan"
	exit 1
fi


# Check de uitvoerlocatie
echo "   Check of u in de juiste map staat..."

# Controleer of de huidige werkmap niet de verwachte map is
if [ "$(pwd)" != "$HOME/hardwareInventoryScan" ]; then

    if ! [ -d "$HOME/hardwareInventoryScan" ]; then
        echo "!  De map hardwareInventoryScan bestaat niet."
        exit 1
    fi

    # Navigeer naar de juiste map
    cd "$HOME/hardwareInventoryScan" || {
        echo "!  Kan de map hardwareInventoryScan niet openen.";
        exit 1;
    }
fi


# Stel een globale variabele in voor de pakketbeheerder
echo "   Pakketbeheerder vaststellen voor automatische updates en"
echo "                            programma-afhankelijkheidsinstallatie."

# Functie om de pakketbeheerder vast te stellen
packetbeheerder=""

if command -v apt &> /dev/null; then
	packetbeheerder="apt"

elif command -v dnf &> /dev/null; then
	packetbeheerder="dnf"

elif command -v pacman &> /dev/null; then
	packetbeheerder="pacman"

else
	echo "!  Geen ondersteunde pakketbeheerder gevonden."
	echo "!  Doorgaan zonder automatische afhankelijkheidsinstallatie?"
	read -p "-> Wilt u doorgaan? (y/N): " -n 1 -r
	echo
	if ! [ $REPLY =~ ^[Yy]$ ]; then
		echo "!  Programma wordt beëindigd."
	exit 1
	fi
fi

#Maak tijdenlijke mappen aan
echo "   tijdenlijke mappen aanmaken..."
mkdir -p /tmp/hardwareScan/




#Start the next script, without preserved variables
## Opeenvolgende scripts moeten worden uitgevoerd met behoud van globale variabelen.
./util-linux.sh

./dmidecode.sh

#Finish
echo ""
echo "-> Uw machine is gescand; de resultaten zijn te vinden in /tmp/hardwareScan."
echo ""
exit 0 
