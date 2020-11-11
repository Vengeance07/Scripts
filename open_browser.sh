#!/bin/bash

# This is just to open brower through cmd and run the url in the browser
# Written by vengeance

echo ; echo 
echo "Opening Firefox Browser..."
echo ; echo
echo "Playing song in youtube.."
echo ; echo

# Command to open browser and run the url in browser
# Enter single url after firefox to open single site
# Enter more than one url to open more than one site on the browser
# Command Below:
# firefox https://www.youtube.com/watch?v=9RaThnnPbuA https://www.youtube.com/watch?v=H-ExNmHo2xI

#OR using -new-tab can also open multiple url in new tabs
# "&" at the end of the cmd is used to run the process in background
firefox https://www.youtube.com/watch?v=9RaThnnPbuA &
sleep 1
firefox -new-tab https://www.youtube.com/watch?v=H-ExNmHo2xI &


