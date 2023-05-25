# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    monitoring.sh                                      :+:    :+:             #
#                                                      +:+                     #
#    By: dreijans <dreijans@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2022/12/14 09:27:31 by dreijans      #+#    #+#                  #
#    Updated: 2022/12/15 17:10:34 by dreijans      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

AR=$(uname -a)
Cphysical=$(nproc --all)
vCPU=$(cat /proc/cpuinfo | grep processor | wc -l)
RAM=$(free -m | grep Mem | awk '{print $2}')
usedRAM=$(free -m | grep Mem | awk '{print $3}')
RAMpercent=$(free -m | grep Mem | awk '{printf("%.2f"), $3/$2*100}')
Discavail=$(df -h --total | grep total | awk '{print $2}')
Discused=$(df -h --total | grep total | awk '{print $3}')
Discpercent=$(df -h --total | grep total | awk '{print $5}')
CPUutil=$(top -bn1 | grep '^%Cpu' | awk '{print $2}')
Lastboot=$(who -b | awk '{print $3, $4}')
LVMuse=$(lsblk |grep LVM | awk '{if ($1) {print "yes";exit;} else {print "no"} }')
ActiveCon=$(netstat -t | grep ESTABLISHED | wc -l)
Userlog=$(who | wc -l)
IPV4=$(hostname -I)
MACad=$(ip link | grep ether | awk '{print $2}')
Sudo=$(journalctl _COMM=sudo | grep COMMAND | wc -l)



wall "  #Architecture:          $AR
        #CPU physical:          $Cphysical
        #vCPU:                  $vCPU
        #Memory Usage:          $usedRAM/${RAM}MB ($RAMpercent%)
        #Disk Usage:            $Discavail/${Discused}b ($Discpercent)
        #CPU load:              $CPUutil%
        #Last boot:             $Lastboot
        #LVM use:               $LVMuse
        #Connections TCP:       $ActiveCon ESTABLISHED
        #User log:				$Userlog
        #Network:				IP $IPV4 ($MACad)
        #Sudo:					$Sudo cmd"
