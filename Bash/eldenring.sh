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
echo "You have chosen the $type class, your hp is $hp and your attack is $attack"

echo "You died"

#First beast battle
while true; do
	echo "You encounter a beast"

	beast=$(( $RANDOM % 2 ))

	echo "Pick a number (0 or 1) :"

	read player


	if [[ $beast == $player && 47 > 23 ]]; then
		echo "You won"
	else
		echo "You died"
		while true; do
			echo "Wanna try again ? (Y/N)"
			read response
			if [[ ${response,,} =~ ^(yes|y|oui|o)$ ]]; then
				break
			elif [[ ${response,,} =~ ^(no|non|n)$ ]]; then
				break 2
			else
				echo "Please answer with (Y/N)"
				continue
		done
	fi
	sleep 2

	#Margit battle

	echo "You encountered Margit"
	beast=$(( $RANDOM % 10 ))
	echo "Pick a number between 0 and 9"
	read player

	if [[ $beast == $player || $player == "coffee" ]]; then
		echo "You won"
	else
		echo "You died"
		sleep 1
		while true; do
			echo "Wanna try again ? (Y/N)"
			read response
			if [[ ${response,,} =~ ^(yes|y|oui|o)$ ]]; then
				break
			elif [[ ${response,,} =~ ^(no|n|non)$ ]]; then
				break 2
			else
				echo "Please anwser with (Y/N)"
				continue
		done
	fi
done
