#!/bin/bash

echo "Welcome tarnished. Please select your starting class:
1 - Samurai
2 - Prisoner
3 - Prophet"

read class

case $class in
 
	1)
		type="Samurai"
		hp=10
		attack=20
		;;
	2)
		type="Prisoner"
		hp=20
		attack=4
		;;
	3)
		type="Prophet"
		hp=30
		attack=4
		;;
esac
sleep 1
echo "You have chosen the $type class, your hp is $hp and your attack is $attack"

#First beast battle
while true; do
	sleep 1
	echo "You encounter a beast"

	beast=$(( $RANDOM % 2 ))
	sleep 1
	echo "Pick a number (0 or 1) :"

	read player


	if [[ $beast == $player ]]; then
		sleep 1
		echo "You won"
		break
	else
		sleep 1
		echo "You died"
			while true; do
				sleep 1
				echo "Wanna try again ? (Y/N)"
				read response
				if [[ ${response,,} =~ ^(yes|y|oui|o)$ ]]; then
					break
				elif [[ ${response,,} =~ ^(no|non|n)$ ]]; then
					sleep 1
					echo "Thanks for playing !"
					exit 0
				else
					sleep 1
					echo "Please answer with (Y/N)"

				fi
			done
	fi
done
sleep 2

#Margit battle
while true; do
	echo "You encountered Margit"
	beast=$(( $RANDOM % 10 ))
	sleep 1
	echo "Pick a number between 0 and 9"
	read player

	if [[ $beast == $player || $player == "coffee" ]]; then
		sleep 1
		echo "You won"
		break
	else
		sleep 1
		echo "You died"

		while true; do
			sleep 1
			echo "Wanna try again ? (Y/N)"
			read response
			if [[ ${response,,} =~ ^(yes|y|oui|o)$ ]]; then
				break
			elif [[ ${response,,} =~ ^(no|n|non)$ ]]; then
				sleep 1
				echo "Thanks for playing !"
				exit 0
			else
				sleep 1
				echo "Please anwser with (Y/N)"

			fi
		done
	fi
done
sleep 1
echo "End of the game, you defeated both enemies"
