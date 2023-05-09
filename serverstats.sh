#!/bin/bash
##################################################
#                                                #
#              Server Status Report              #
#                  v0.1 - 2023                   #
#                                                # 
#          Nick Porter / Anneliese Ward          #
#         nap23@unm.edu / anw0412@unm.edu        #
#        Research Computing Facilitators         #
#     Center for Advanced Research Computing     #
#            University of New Mexico            #
#                                                #
##################################################

#Ask for the name of the server. Will be used to generate a report with the servers name.
echo What is the name of this server?

read servername

#Check OS version
echo \n -----------------Operating System-----------------  
echo hostnamectl > $servername-status-report.txt

#Check memory
echo \n -----------------Memory Status-----------------  
echo free -h >> $servername-status-report.txt

#Check mounted drives
echo \n -----------------Mounted Devices-----------------  
echo lsblk >> $servername-status-report.txt

#Check newtork device status
echo \n -----------------Network Status-----------------  
echo nmcli >> $servername-status-report.txt

#Check systemd status
echo \n -----------------Systemd Status-----------------  
echo systemctl status >> $servername-status-report.txt

#List failed services
echo \n -----------------Failed Services----------------- 
echo systemctl failed >> $servername-status-report.txt
