#!/bin/bash
echo "Comment tu t'appelles ?"
read name

while true; do
	sleep 1
	echo "Quel âge as-tu ? (Répondre avec juste un nombre)"
	read age
	if [[ $age =~ ^[0-99]*$ ]]; then
		break
	else
		sleep 1
		echo "Merci de répondre simplement avec un nombre et rien d'autre" 
	fi
done
getrich=$(( $RANDOM % 15 + $age ))

sleep 1
echo "Salut $name, tu as $age ans. On va calculer à quel âge tu vas devenir riche !"

sleep 3

echo "En train de calculer"
sleep 1
echo ".........."
sleep 1
echo "**........"
sleep 1
echo "****......"
sleep 1
echo "******...."
sleep 1
echo "********.."
sleep 1
echo "**********"
sleep 1

echo "$name, tu deviendras riche à $getrich ans !"

