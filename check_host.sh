#!/bin/bash

#This script checks the status of hosts provided by the user and mail the user when it finds the host which is down


for i in $@
do
ping -c 1 $i &> /dev/null

if [ $? -ne 0 ] ; then
	echo "'date': ping failed, $i host is down!" | mail -s "$i host is down!" abc@gmail.com
fi
done
 
