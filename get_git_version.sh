#!/bin/bash

# This script lists all git versions from git-scm
# By Vengeance

# Checking if wget is installed or not and storing output at /dev/null
which wget > /dev/null

# $? checks the status/error code of perviously executed command in this case "which wget"
# If the status code is 0 then the command was success if not 0 then the command failed
if [[ $? -ne 0 ]]
then
	echo "Please install wget and retry" ; exit 1
fi

# Check if there is index.html file because wget downlads html file from given url and saves it to index.html
if [[ -e index.html ]] ; then
	echo "Removing old index.html file"
	rm -rf index.html
fi

url="https://mirrors.edge.kernel.org/pub/software/scm/git/"
wget $url
if [ $? -ne 0 ]
then 
	echo "wget executation failed. Unable to download git info from $url"
	exit 2
fi

echo "-------------------------------------------------------------------------"
echo "Please wait. Collecting all git versions from official website of git-scm"
echo "-------------------------------------------------------------------------"
# Declaring an array
declare -a git_vers
while read line
do
	git_vers+=($(echo $line | sed -n '/git-\([0-9]\+\.\)\+tar.gz/p' | awk -F '"' '{ print $2 }' | cut -c 5- | awk -F '.tar.gz' '{ print $1}'))
done < index.html

echo "All available git versions are: "
count=0 
no_vers=${#git_vers[*]}
width=20
for each_ver in  ${git_vers[*]}
do 
	#echo -e "\t\t ${git_vers[$count]} \\t ${git_vers[$((count+1))]} \\t ${git_vers[(($count+2))]}"
	printf "%-*s %-*s %-*s %-*s %-*s %-*s\n" $width ${git_vers[$count]} $width ${git_vers[$((count+1))]} $width ${git_vers[(($count+2))]} $width ${git_vers[(($count+3))]} $width ${git_vers[(($count+4))]} $width ${git_vers[(($count+5))]}
	count=$((count+6))
	if [ $count -ge $no_vers ]
	then
		break
	fi
done



