#!/bin/bash
# Copyright Feike Donia 2024
# GNU LGPLv3

clear
script="hardwareInventory.sh"
echo "-> $script wordt uitgevoerd..."

# Check of het script als root wordt uitgevoerd.
echo "   Check of het script als root wordt uitgevoerd..."
if [ "$(id -u)" != 0 ]; then 
	echo "!  Dit script heeft root(admin) rechten nodig om te draaien."
	echo "!  Gelieve dit script te heropenen in root shell:"
	echo "!  'su' of 'sudo ./hardwareScan'."
	exit 1
fi

# Check de uitvoerlocatie
echo "   Check of u in de juiste map staat..."
if [ "$(pwd)" != "$HOME/hardwareInventoryScan" ]; then
	if ! [ -d "$HOME/hardwareInventoryScan" ]; then
		echo "!  Kan de hardwareInventoryScan map niet vinden."
		exit 1
	fi
	cd "$HOME/hardwareInventoryScan"
fi
	
# Voeg functionaliteit toe:
# 3. Vraag aan de gebruiker of die wilt updaten.
# Haal functionaliteit weg:
# 4. Meganisme om te bepalen of het systeem recent is geüpdatet,
#	 omdat het overbodig is.

# Stel een globale variabele in voor de pakketbeheerder
echo "   Pakketbeheerder vaststellen voor automatische updates en"
echo "                            programma-afhankelijkheidsinstallatie."

# Functie om de pakketbeheerder vast te stellen
packetbeheerder() {
    if command -v apt &> /dev/null; then
        pakketbeheerder="apt"
    elif command -v dnf &> /dev/null; then
        pakketbeheerder="dnf"
    elif command -v pacman &> /dev/null; then
        pakketbeheerder="pacman"
    else
        echo "Geen ondersteunde pakketbeheerder gevonden."
        exit 1  # Stop het script als er geen pakketbeheerder gevonden is
    fi
}

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
