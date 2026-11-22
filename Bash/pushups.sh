#!/bin/bash
echo "How many pushups do you want to do ?"
read y
x=1
while [[ $x -le y ]]
do
	read -p "Pushup $x: Press enter to continue"
	(( x ++ ))
done
echo "Congrats, you completed your pushups !!"
