#!/bin/bash
while true; do
	sleep 1
	echo "Pile ou Face ?"
	read player

	if [[ ${player,,} =~ ^(pile|face)$ ]]; then 
		sleep 1
		echo "Vous avez choisi ${player^}"
	else
		sleep 1
		echo "Merci de répondre par (Pile/Face)"
		sleep 1
		continue
	fi

	random=$(( $RANDOM % 2 ))
	if [[ $random == 0 ]]; then
		random="Pile"
	else
		random="Face"
	fi

	sleep 1

	if [[ ${player,,} == ${random,,} ]]; then
		echo "Gagné ! C'est $random"
	else
		echo "Perdu ! C'est $random" 
	fi

	sleep 1
	while true; do
		echo "Voulez-vous continuer à jouer ? (Oui/Non)"
		read reponse
		if [[ ${reponse,,} =~ ^(oui|yes|o|y)$ ]]; then
			sleep 1
			break

		elif [[ ${reponse,,} =~ ^(non|no|n)$ ]]; then
			sleep 1
			echo "Merci d'avoir joué"
			break 2
		else
			sleep 1
			echo "Merci de répondre par (Oui/Non)"
			continue
		fi
	done
done

