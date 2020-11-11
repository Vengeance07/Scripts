#!/bin/bash

# This script is used to check the laptop System Information
# Written By Vengeance

# Check if the user has sudo privilages
#read -p "This requires sudo permission. Press any key to continue" key
# Checking if user is root
if [ $(whoami) != "root" ] 
then
	echo "You must be root user or run this script with sudo privilages"
	exit 
else
	dmidecode | grep -A 9 "System Information"
fi

if 

# Root or sudo privilages can also be found using user id "id -u" 
# If the output of above command is 0 then the user have sudo privilages 
<<COMMENT
if [ $(id -u) -ne 0 ]
then
	echo "You must be root user or run this script with sudo privilages"
	exit 
fi
COMMENT
