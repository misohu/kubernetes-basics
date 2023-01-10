#!/bin/bash

# To kreate k8s resource from manifest we can use apply command with -f flag
kubectl apply -f nginx-pod.yaml

# Check pods 
kubectl get po

# Sometimes we are lazy to write whole manifest so we can generate one from run command 
kubectl run nginx-pod --image=nginx --port 80 --dry-run=client -o yaml > tmp.yaml

# You can now remove the pod 
kubeclt delete po nginx-pod