#!/bin/python3
import os
import platform
import socket
import psutil
import time
from datetime import datetime
#ThinkCyber Python Fundamental Project XE105 OS-INFO By Olalekan Ilori - s4

s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.connect(("8.8.8.8", 80))
ipdetail=s.getsockname()[0]

while [ 1==1 ]:   #condition for maintaining a loop sequence
	osname=platform.system()
	osversion=platform.release()
	print("Operating System Version:", osname, osversion)
	#print(os.system('ifconfig'))
	print("------------------------")
	print("Private IP Address:", ipdetail)
	print("------------------------")
	public=os.popen('curl -s ifconfig.co').read()
	print ("Public IP Address:", public)
	print("------------------------")
	hddsize = os.popen('fdisk -l|grep Disk|head -n1 ').read()
	hddlst = hddsize.split()
	hddsize2=os.popen('df -H|grep sda').read()
	hddlst2=hddsize2.split()
	#print("Disk Size2:",hddlst[2],hddlst[3])
	print("Disk Size:",hddlst2[1])
	print("Used  Disk Space:", hddlst2[2])
	print("Available Disk Space:", hddlst2[3])
	print("------------------------")
	print("Top 5 Directories")	
	a=os.popen('ls / -lSah |grep root|head -5').read()
	b=a.split("\n")
	top1=b[0].split(" ")
	top2=b[1].split(" ")
	top3=b[2].split(" ")
	top4=b[3].split(" ")
	top5=b[4].split(" ")
	print("Size  Dir")
	print("",top1[-5],"",top1[-1], "\n",top2[-5],"",top2[-1],"\n",top3[-7],"",top3[-1],"\n",top4[-5],"",top4[-1],"\n",top5[-7],top5[-1])	
	print("------------------------")
	print("CPU Usage Stats")	
	a=psutil.getloadavg()
	cpuusage1 = (a[0]/os.cpu_count()) * 100
	cpuusage2 = (a[1]/os.cpu_count()) * 100
	cpuusage3 = (a[2]/os.cpu_count()) * 100
	#print(cpuusage1,"%")
	#print(cpuusage2,"%")
	print("Number of CPU cores:",os.cpu_count())
	print("The CPU usage last 15mins is : ", cpuusage3)
	print("------------------------")
	print("Timestamp:",datetime.utcnow())
	print("------------------------")
	time.sleep(10)
	os.system('clear')
	

