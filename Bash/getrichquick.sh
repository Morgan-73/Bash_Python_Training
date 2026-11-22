#!/bin/bash

echo "What is your name ?"
read name

echo "How old are you ?"
read age

getrich=$(( $RANDOM % 15 + $age ))

echo "Hello $name, you are $age years old"

sleep 2

echo "Calculating"
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

echo "$name, you will become rich at $getrich years old !"
