#!/bin/bash
# This script provides index to other scripts
# Written by Vengeance

clear
# Banner for the script
line="---------------------------------------------"
echo; echo; echo "$line" ; echo "My Collection of Scripts" ; echo $line ; echo ; echo

# Options to choose among different scripts
echo "1. Ping Id addresses (subnets)"
echo "2. Open Browser and run url"
echo "3. Update Linux System"
echo "4. ifelse (Practise Script)"
echo "5. Exit" ; echo ; echo

x=0
while [ $x -eq 0 ]
do
	# Prompt message to user and save the input in "choice" variable using read command
	read -p "Choose a number from 1 to 5: " choice 

	# Taking the choice from the user and processing accordingly
	# Scripts will be executed as the user input the numbers
	# If the user provide the wrong input then echo message is displayed
	case $choice in 
		1) ./ipsweep.sh ; x=1;; 
		2) ./open_browser.sh ; x=1;;
		3) ./update.sh ; x=1;;
		4) 
		echo ; echo ; echo $line ; echo "Welcome to IfElse practice script" ; echo $line ; echo ; echo
		echo -n "please enter first argument: " ; read arg1
		echo -n "Please enter second argument: " ; read arg2
		echo -n "Please enter third argument: " ; read arg3 
		echo ; echo "Script Output: "
		 ./ifelse.sh $arg1 $arg2 $arg3 ; x=1;;
		5) exit ;; 
		*) echo "You have entered a wrong choice." ;;
	esac
done
