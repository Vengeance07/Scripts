#!/bin/bash

# Store value of a linux command in a variable [ storing value of "ls" command in variable "ls_value"

# Checking if the argument is passed while running the script or not using "$#" 
cmd_line_args=$#

# If there is one argument passed we run the code as we only need one argument to run the code
# We would use [ $cmd_line_args -eq 2 ] if we have to take 2 argument and so on for 3 or more arguments 
if [ $cmd_line_args -eq 1 ] 
then 
	ls_value=$(ls $1)
	i=1
	echo -e "\e[32mThe output of ls command is: \e[0m"
	for val in $ls_value 
	do
		echo $i") "$val; i=$(($i+1));
	done 
fi

# Select statement can be used to display options for user to select
# It can be best used with case
echo; echo; echo -e "\e[32mSelect Option:\e[0m" 
select option in Ride Walk "Run Today" Swin Exit
do 
	case $option in 
		Ride) echo "You Choose to Ride" ;;
		Walk) echo "You Choose to Walk" ;;
		"Run Today") echo "You Choose to Run Today" ;;
		Swin) echo "You Choose to Swim" ;;
		Exit) echo "Visit Again" ; exit ;;
	esac
done


