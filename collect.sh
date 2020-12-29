#!/bin/bash

HOSTDIR=/mnt/npmlogs/$HOSTNAME
COMPRESSEDFILE=${HOSTDIR}.tar.gz
mkdir -p $HOSTDIR

echo "logs will be stored in $HOSTDIR"
echo "start to collect log: $(date)" >> $HOSTDIR/date.txt

echo "Dumping Azure Npm Logs begin"
cat /var/log/azure-npm.log >> $HOSTDIR/azure-npm.log

echo "Dumping IPTABLES-RULES"
iptables -vnL >> $HOSTDIR/iptables.txt
echo "Dumping IPTABLES-SAVE"
iptables-save >> $HOSTDIR/iptables.txt
echo "Dumping IPSET LISTS"
ipset list > $HOSTDIR/ipsetlist.txt
echo "Dumping ROUTE LISTS"
ip route list >> $HOSTDIR/iproute.txt
ip rule >> $HOSTDIR/ipsetlist.txt

echo "Dumping kubectl network policy all name-spaces"
kubectl get networkpolicy --all-namespaces >> $HOSTDIR/all-networkpolicies.txt
kubectl get networkpolicy --all-namespaces -o yaml >> $HOSTDIR/all-networkpolicies.txt

echo "Dumping kubectl get pods -o wide"
kubectl get pods --all-namespaces -o wide >> $HOSTDIR/all-pods.txt
kubectl get pods --all-namespaces -o yaml >> $HOSTDIR/all-pods.txt

echo "Dumping kubectl cluster-info"
kubectl cluster-info >> $HOSTDIR/cluserinfo
kubectl version >> $HOSTDIR/cluserinfo

echo "finished to collect log: $(date)" >> $HOSTDIR/date.txt

echo "compress log into $COMPRESSEDFILE"
tar -czvf $COMPRESSEDFILE $HOSTDIR
rm -rf $HOSTDIR

while $(true)
do 
echo "completed collecting logs, do not delete the logger till you copied the files"
sleep 40
done

