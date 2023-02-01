#!/bin/bash

# Create the pod with the namespace flag 
kubectl run nginx-pod --image nginx --port 80 --namespace default
# Check how the manifest changes by adding namespace
kubectl run nginx-pod --image nginx --port 80 --namespace default --dry-run=client -o yaml

# Get all running pods in the current cluster (check the status field right after you run those for first time)
kubectl get po 
# Get more info about pods (cluster wide IP of pod, node where the pod is running)
kubectl get po -o wide 

# Get more info about the node 
kubectl describe po nginx-pod

# Try to deploy non existing container 
kubectl run nginx-pod-nonsense --image nginx:nonsense --port 80

# Check the Status field
# STATUS in get po is fusion of status of pod containers and reason for the status
kubeclt get po 
kubectl describe po nginx-pod-nonsense 
# Check that the pod is constantly trying again and again

# Delete failing pod
kubectl delete po nginx-pod-nonsense 

# Check logs of working nginx
kubectl logs nginx-pod

# Use -f to follow logs 
kubectl logs -f nginx-pod

# Getting into ocntainer (ti is attatching terminal to container and passing the input to container)
kubectl exec -ti nginx-pod -- bash
# You can install tools
apt update
apt install vim
# you can edit files
vim /usr/share/nginx/html/index.html
kubectl port-forward nginx-pod 8080:80

# Now delete and recreate and it will not persist
kubectl delete po nginx-pod
kubectl run nginx-pod --image nginx --port 80 --namespace default
