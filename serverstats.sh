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

echo What is the name of this server?

read servername

d=$(date +%Y-%m-%d)

{
	echo -e "-----------------Operating System-----------------\n"
	hostnamectl
	echo -e "\n-----------------Memory Status-----------------\n"
	free -h
	echo -e "\n-----------------Mounted Devices-----------------\n"
	lsblk
	echo -e "\n-----------------Network Status-----------------\n"
	nmcli
	echo -e "\n-----------------Listening UDP/TCP Ports-----------------\n"
	ss -ltu
	echo -e "\n-----------------Systemd Status-----------------\n"
	systemctl status
	echo -e "\n-----------------Failed Services-----------------\n"
	systemctl --failed
	echo -e "\n-----------------End of Report-----------------"
} > $servername-status-report-$d.txt
