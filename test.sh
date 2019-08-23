#!/bin/bash
while [ ! -f /mnt/npmlogs/config  ] ;
do
      sleep 2
      echo "waiting for the config file ,please place it in share"
done

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
echo "****************Dumping kubectl network policy all name-spaces***********" >>/mnt/npmlogs/$HOSTNAME.log
kubectl get networkpolicy --all-namespaces --kubeconfig /mnt/npmlogs/config >>/mnt/npmlogs/$HOSTNAME.log
kubectl get networkpolicy --all-namespaces -o yaml --kubeconfig /mnt/npmlogs/config >>/mnt/npmlogs/$HOSTNAME.log
echo done *************************** >> /mnt/npmlogs/$HOSTNAME.log
echo ""
echo "****************Dumping kubectl get pods -o wide ***********" >>/mnt/npmlogs/$HOSTNAME.log
kubectl get pods --all-namespaces -o wide --kubeconfig /mnt/npmlogs/config >>/mnt/npmlogs/$HOSTNAME.log
kubectl get pods --all-namespaces -o yaml --kubeconfig /mnt/npmlogs/config >>/mnt/npmlogs/$HOSTNAME.log
echo done *************************** >> /mnt/npmlogs/$HOSTNAME.log
echo "****************Dumping kubectl cluster-info ***********" >>/mnt/npmlogs/$HOSTNAME.log
kubectl cluster-info --kubeconfig /mnt/npmlogs/config >>/mnt/npmlogs/$HOSTNAME.log
echo done *************************** >> /mnt/npmlogs/$HOSTNAME.log
echo ""
echo Closing log at >> /mnt/npmlogs/$HOSTNAME.log
date >> /mnt/npmlogs/$HOSTNAME.log
echo "Please share this logs with Support" >> /mnt/npmlogs/$HOSTNAME.log

while $(true)
do 
echo "completed collecting logs,do not delete the logger till you copied the files"
sleep 40
done




