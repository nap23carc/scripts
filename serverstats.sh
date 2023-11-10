#!/bin/bash
##################################################
#              Server Status Report              #
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
  echo -e "\n----- Operating System -----\n"; hostnamectl
  echo -e "\n----- Memory Status -----\n"; free -h
  echo -e "\n----- Mounted Devices -----\n"; lsblk -f
  echo -e "\n----- Mounted Filesystems -----\n"; findmnt
  echo -e "\n----- Network Device Status -----\n"; nmcli device show
  echo -e "\n----- Listening UDP/TCP Ports -----\n"; ss -ltu
  echo -e "\n----- Running Services -----\n"; systemctl --type=service --state=running
  echo -e "\n----- Failed Services -----\n"; systemctl --failed
  echo -e "\n----- Users -----\n"; getent passwd
  echo -e "\n----- Groups -----\n"; getent group
  echo -e "\n##### END OF REPORT #####"
} > $server-report-$date.txt 2>&1
