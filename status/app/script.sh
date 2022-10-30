#!/usr/bin/sudo bash
set echo off
#get cpu usage
top -bn1 | grep "Cpu(s)" | \
           sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
           awk '{print 100 - $1"%"}'
#get free memory in human readable form
free -h | grep Mem| awk '{print $4}'
#get free disk space
df -h /home | grep dev | awk '{print $4}'
#get kernel version
uname -r
#update the update tree from the internet
apt-get upgrade > /dev/null 
#search in the newly update tree
apt list --upgradable -a 2>/dev/null  | grep upgradable
