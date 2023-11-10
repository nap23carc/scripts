#!/bin/bash
##################################################
#     Scientific Linux Server Status Report      #
#                  v0.5 - 2023                   #
#        Nicholas Porter / Anneliese Ward        #
#         nap23@unm.edu / anw0412@unm.edu        #
#        Research Computing Facilitators         #
#     Center for Advanced Research Computing     #
#            University of New Mexico            #
##################################################
server=$(hostname)
date=$(date +%Y-%m-%d_%H-%M)
{
  echo -e "##### BEGINNING OF REPORT #####"
  echo -e "\n----- Operating System -----\n"; echo "Hostname:" $server ; lscpu
  echo -e "\n----- Memory Status -----\n"; free -h
  echo -e "\n----- Mounted Devices -----\n"; lsblk ; ls -lha /dev/disk/by-uuid
  echo -e "\n----- Mounted Filesystems -----\n"; findmnt
  echo -e "\n----- Network Device Status -----\n"; ifconfig
  echo -e "\n----- Listening UDP/TCP Ports -----\n"; ss -ltu
  echo -e "\n----- Services -----\n"; service --status-all
  echo -e "\n----- Users -----\n"; cat /etc/passwd
  echo -e "\n----- Groups -----\n"; cat /etc/group
  echo -e "\n##### END OF REPORT #####"
} > $server-report-$date.txt 2>&1
