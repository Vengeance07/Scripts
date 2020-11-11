#!/bin/bash

#This script is used for subdomain enumeration and scanning for ports on alive hosts
# By Vengeance

#Checking if the user has passed the argument 
if [[ -z "$1" ]] # Same as $1 == "" | -z indicating if the value is zero or null 
then
echo " Please enter domain name"
echo "Syntax: subdomain.sh ; eg: yahoo.com"

else
#Checking if there is directory name "thirdlevels"
#If not it will make directory
if [ ! -d "thirdlevels" ]; then
mkdir thirdlevels
fi

#Checking if there is directory name "scans"
#If not it will make directory
if [ ! -d "scans" ] ; then
mkdir scans
fi

#Print working directory and save it to pwd variable
pwd = $(pwd)
echo "This is working directory" $pwd

#Gathering subdomains with subfinder and storing output to final.txt
echo "Gathering subdomains with subfinder..."
subfinder -d $1 -o final.txt

#Appending user entered domain into final.txt
echo $1 >> final.txt

#If the domain contain more than third level domain eg: api.advertising.yahoo.com [i.e. 4th level domain]
#This regex is used to trim down to third level domain eg: advertising.yahoo.com
echo "Compiling third-level domains..." 
cat final.txt | grep -Po "(\w+\.\w+\.\w+)$" | sort -u >> third-level.txt

#Enumerating more subdomains from previously found third-level domains
#Uncomment below code for further enumeration....
#echo "Gathering full third-level domains with subfinder..."
#for domain in $(cat third-level.txt); do subfinder -d $domain -o thirdlevels/$domain.txt; cat thirdlevels/$domain.txt | sort -u >> final.txt; done

#Probing for alive domains in final.txt using httprobe 
#Using sed to remove https:// from the output 
#Using tr to remove :443 form the output
echo "Probing for alive third-levels..."
cat final.txt | sort -u | httprobe -s -p https:443 | sed 's/https\?:\/\///' | tr -d ":443" > probed.txt

echo "Scanning for open ports"
nmap -iL probed.txt -T5 -oA scans/scanned.txt

fi
