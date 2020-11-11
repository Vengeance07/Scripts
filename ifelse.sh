#!/bin/bash

# if else practice script
# Written by Vengeance

# -e in echo command is used to enable parsing of the escape sequences.
# "\e[1m" is used to make bold : "\e[31m" = red colour : "\e[0m" = end of color and formatting
# "\e[32m" green colour : "\e[5m" = Blink text

if [[ $1 == "" ]] 
then
	echo -e "\e[1m\e[31mNo argument passed\e[0m"
	echo -e "\e[32m\e[5mEnter atleast one\e[0m argument"
	exit
elif [[ $2 == "" ]] 
then
	echo "Hello" $1
	echo "Second argument not passed"
	exit
elif [[ $3 == "" ]]
then 
	echo "Hello" $1 ; echo "Hello" $2 ; echo "Third argument not passed"
	exit
else 
	echo "Hello" $1
	echo "Hello" $2
	echo "Hello" $3
	#echo "Only three argument supported"
fi


