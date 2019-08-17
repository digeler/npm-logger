#!/bin/bash


 sleep 5
echo "start log is :" >> /mnt/npmlogs/$HOSTNAME.log
echo $HOSTNAME ******$HOSTNAME****** >>/mnt/npmlogs/$HOSTNAME.log
echo "start log is :" >> /mnt/npmlogs/$HOSTNAME.log
date >> /mnt/npmlogs/$HOSTNAME.log
echo Dumping ********IPTABLES-RULES FOR HOST $HOSTNAME ************>> /mnt/npmlogs/$HOSTNAME.log
iptables -L -t filter -n >> /mnt/npmlogs/$HOSTNAME.log
echo done *************************** >> /mnt/npmlogs/$HOSTNAME.log
echo ************Dumping IPSET RULES ********** >> /mnt/npmlogs/$HOSTNAME.log
ipset list >> /mnt/npmlogs/$HOSTNAME.log
echo done *************************** >> /mnt/npmlogs/$HOSTNAME.log
echo *********Dumping Azure Npm Logs begin ************ >> /mnt/npmlogs/$HOSTNAME.log
cat /var/log/azure-npm.log >> /mnt/npmlogs/$HOSTNAME.log
echo done *************************** >> /mnt/npmlogs/$HOSTNAME.log
echo "*********Dumping IPTABLES-SAVE************" >>/mnt/npmlogs/$HOSTNAME.log
echo ""
iptables-save >> /mnt/npmlogs/$HOSTNAME.log
echo done *************************** >> /mnt/npmlogs/$HOSTNAME.log
echo Closing log at >> /mnt/npmlogs/$HOSTNAME.log
date >> /mnt/npmlogs/$HOSTNAME.log
echo "Please share this logs with Support" >> /mnt/npmlogs/$HOSTNAME.log
while $(true)
do 
echo "completed collecting logs"
sleep 40
done




