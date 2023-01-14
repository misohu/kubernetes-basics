#!/bin/bash

# Check existing daemonsets
kubectl get daemonset --all-namespaces

# You can only create it from manifest which is the same as deployment 
kubectl create deployment nginx --image=nginx --port 80 --dry-run=client -o yaml  > daemonset.yaml

# Edit the type to DaemonSet
kubectl apply -f nginx-daemonset.yaml

