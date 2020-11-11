#!/bin/bash
read -p "Enter ip/hostname: " ip
echo "Scanning For: $ip"
echo "Running Fast Scan"
nmap -F $ip
echo "Running Service Version Scan"
nmap -sV $ip
