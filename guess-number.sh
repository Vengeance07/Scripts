#!/bin/bash

# This script is a number guessing game at least tries
# Written by Vengeance

# $RANDOM - generates random number 
number=$RANDOM
attempt=1
for (( ; ; ))
do 
	echo "Number of Attempt: $attempt" 
	read -p "Guess the random number generated: " user_number
	
	if [ $user_number -eq $number ] ; then
		echo; echo;
		echo "Congrats, You have guessed the correct number"
		echo "Total number of attempts: $attempt"
		break
	elif [ $user_number -gt $number ] ; then
		echo "Your guessed number is greater than the random number"
		echo "Please enter lower number"
	else 
		echo "Your guessed number is lower than the random number"
		echo "Please enter higher number" 
	
	#else
		#echo "Sorry, You guessed the wrong number"
	fi

	attempt=$(($attempt+1))
done
