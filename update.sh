#!/bin/bash

# update.sh (Version 1.0)
# Script to fully update your linux system
# By Vengeance (Open Source Project) XD
# use --help to see its usages

# Set bash to quit script and exit on errors:
set -e

# Functions:

update(){
	echo "Starting full system update..."
	sudo apt-get update
	sudo apt-get dist-upgrade -yy
}

clean(){
	echo "Cleaning up..."
	sudo apt-get autoremove -yy
	sudo apt-get autoclean
}

leave(){
	echo "--------------------"
	echo "- Update Completed -"
	echo "--------------------"
	exit
}

update-help(){
cat << _EOF_
Update.sh is a tool to automate the update process for linux systems.

Commands:
	update.sh = full system update.
	Running "update.sh" with no options will update the apt cache and then perform a full distribution update automatically.
	
	update.sh --clean = full system update with cleanup
	Using "--clean" option will remove all the locally cached packages that are no longer in the repositories and remove orphaned packages that are no longer needed by programs. Also update the system.
	
	up --help = shows this help page.
	
_EOF_
}

# Execution
# About the program
echo "Update -- Debian/Ubuntu Update Tool (Version 1.0)" ; echo "By Vengeance"; echo ""

# Update and Clean:

if [ "$1" == "--clean" ] ; then
	update
	clean
	leave
fi

if [ "$1" == "--help" ] ; then
	update-help
	exit
fi

# Check for invalid argument

if [ -n "$1" ] ; then
	echo "Error (update.sh): Invalid argument. Try 'update --help' for more info." >&2
	exit 1
fi

# Normal usage (Only update.sh)
update
leave

