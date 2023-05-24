#!/bin/bash
##################################################
#              Server Status Report              #
#                  v0.3 - 2023                   #
#        Nicholas Porter / Anneliese Ward        #
#         nap23@unm.edu / anw0412@unm.edu        #
#        Research Computing Facilitators         #
#     Center for Advanced Research Computing     #
#            University of New Mexico            #
##################################################
server=$(hostname)
date=$(date +%Y-%m-%d_%H-%M-%S)
{
  echo -e "##### BEGINNING OF REPORT #####"
  echo -e "\n----- Operating System -----\n"; hostnamectl
  echo -e "\n----- Memory Status -----\n"; free -h
  echo -e "\n----- Mounted Devices -----\n"; lsblk
  echo -e "\n----- Network Status -----\n"; nmcli
  echo -e "\n----- Listening UDP/TCP Ports -----\n"; ss -ltu
  echo -e "\n----- Running Services -----\n"; systemctl --type=service --state=running
  echo -e "\n----- Failed Services -----\n"; systemctl --failed
  echo -e "\n##### END OF REPORT #####"
} > $server-status-report-$date.txt 2>&1
