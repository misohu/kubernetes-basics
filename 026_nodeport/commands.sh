#!/bin/bash

# Recap from last time 
# exposing a pod/deployment by default uses ClusterIp
kubectl run nginx --image=nginx --port 80
kubectl expose pod nginx --port 8080 --target-port 80 
kubectl get svc nginx -o yaml 
kubectl delete svc nginx 

# Expose using nodeport
kubectl expose pod nginx --target-port 80 --type NodePort

# Check services random port has been assigned 
kubectl get svc 

# Now we can directly access the ip of the node with that port (any node) to access nginx
# In case of microk8s the localhost is the ip to use !!

# Check the service type 
kubectl get svc <name> -o yaml
