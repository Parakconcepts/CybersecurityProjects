#!/bin/bash

#TITLE:--A bash script to automatically execute commands on a remote server anonymously from my local system
#---------------------------------------------#
#STUDENT NAME ; 	Olalekan Ilori 
#STUDENT CODE ; 	s4
#CLASS CODE   ; 	Unit 0722
#LECTURER'S NAME;	David Shiffman
#---------------------------------------------#

#Code for Checking if my system is anonymous
echo "$(geoiplookup $(curl -s ifconfig.me))" > myIPadd  #checks the geolocation of systems ipaddress
cat myIPadd|awk '{print $5}' > myCountry

for i in $(cat myCountry)								#takes ip in the file
do
echo "Your Ip address is from $i "
done
if	[ "$i" == "Nigeria" ]  								#checks if my ip still from Nigeria
then
	cd /home/kali/nipe									#if ip still Nigeria, it changes directory to Nipe folder to access Nipe tool
	perl nipe.pl restart								#starts the nipe tool to make ip anonymous
	cd /home/kali										#changes directory back to current directory
	echo "You're Not Anonymous, relaunch this script to become anonymous..."
	echo "$(cat myCountry)"
else
	echo "You're in Anonymous State Already......"
fi

#2---In section below, After achieving anonyous IP, script Automaticaly connect to a remote VPS server(156.67.208.189) via ssh and executing commands to a Target server

#---the one-liner script below Enables bypassing fingerprint with "sshpass -p" and Stores the result locally into the file NRproject.tst in current directory

sshpass -p MjsbBaU30OtuZEh ssh -o StrictHostKeyChecking=off root@156.67.208.189   'whois boilecon.com && nmap -F boilecon.com' > NRproject.tst		

echo " [+} The result of your scan has been stored in the file NRproject.tst inside current directory"



