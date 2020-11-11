#!/bin/bash
# This script is used to ping the ip addresses
# Written By Vengeance
#This is the way to ping ip adresses

if [ $1 == "" ]; then
echo "You forget an IP address"
echo "Syntax: ./ipsweep.sh : Example: 192.168.1"

else
echo "IP ping started"
echo "Lists of pingable IPs: "

for ip in {1..254..1}
do
ping -c 1 $1.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":"
done
echo "Completed"

fi


# Another way to ping IP Addresses
echo "----------------------"
echo "- Second way to ping -"
echo "----------------------"
up_ping(){
	ping -c 1 $2 > /dev/null
	# "$?" is used to check the exit status of the previous code
	# if exit status is 0 then the code ran without error
	[ $? -eq 0 ] && echo Node with IP: $i is up.
}

for i in 192.168.254.{1..255}
do 
up_ping $i & disown
done
exit
