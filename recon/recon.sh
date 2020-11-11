#!/bin/bash

start_subfinder(){
	subfinder -d $1 -o $1/final.txt
}

start_httprobe(){
	echo; echo ; echo "Scanning for live hosts using httprobe"
	cat $1/final.txt | sort -u | httprobe -s -p https:443 | sed 's/https\?:\/\///' | tr -d ":443" > $1/probed.txt
}

start_nmap(){
	echo ; echo ; echo "Running Nmap scan on live hosts"
	nmap -iL $1/probed.txt -T5 -oA $1/scans/scanned.txt
}
completed(){
	echo ; echo ; echo "Scan Completed" ; echo ; echo
	echo "Scanned result of subfinder is saved in \"$1/final.txt\""
	echo "Scanned result of httprobe is saved in \"$1/probed.txt\""
	echo "Scanned result of Nmap is saved in \"$1/scans\""
}

# Checking if the user has provided only one domain as an argument 
if [ ! $# -eq 1 ] 
then
	echo " Please enter domain name"
	echo "Syntax: recon.sh ; eg: ./recon.sh yahoo.com"
else

	 
	mkdir -p $1
	
	# Can also be done by using "mkdir -p $1/scans" insted of using if to check for directory
	if [ ! -d "$1/scans" ] ; then
		mkdir $1/scans
	fi
	
	start_subfinder $1
	
	start_httprobe $1
	
	start_nmap $1
	
	completed $1
fi
