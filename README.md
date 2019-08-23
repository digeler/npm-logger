Npm logger is a tool to get all logs needed to ts azure npm 

very simple to use just run the yaml file it will install ds ,and see the logs in a dynamic pvc share.

Detail instructions : 

1. Git clone the repo to your local pc 
2. Edit the newyaml.yaml so it will match your cluster name (see remark on yaml)
3. Run kubectl create -f newyaml.yaml
4. Place your cluster config file in the root of the shared storage account
5. Wait untill the pod reports completed.
6. Download the data and provide to support
7. Delete the daemonset by kubectl delete -f newyaml.yaml



collects :

iptables -L -t filter -n 

ipset list

iptables-save

npm-logs

kubectl get pods 

kubectl get networkpolicy



