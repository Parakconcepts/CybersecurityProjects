#!/bin/bash
#A Simple bash script displaying a summary of my Kali Linux OS information 
#and refreshing every 10 seconds. The script was written using Nano shell environment.

while [ 1==1 ]
do 

echo "Linux Version: $(uname -a |awk '{print $2,$3}')";
echo "Private IP: $(ifconfig|grep inet|head -n1|awk '{print $2}')"
echo -e "Public IP: $(curl -s  ifconfig.co)" 
echo "Default Gateway: $(route -n|grep UG |awk '{print $2}')"
echo "Disk Size: $(fdisk -l|grep Disk|head -n1|awk '{print $3$4}'|tr "," " ")"
echo "Disk Size: $(df -H|grep sda|awk '{print $2}') "
echo "Used  Disk Space: $(df -H|grep sda|awk '{print $3}') "
echo "Available Disk Space: $(df -H|grep sda|awk '{print $4}') "
echo "Top 5 Directories By Size: "
echo "---------------------------"
echo "$(ls / -lSah |grep root|head -5|awk '{print $5,$9}')"
echo "CPU Usage Statistics:"
echo "---------------------------"
echo -e "$(mpstat)"
sleep 10
clear
done
