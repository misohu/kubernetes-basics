#!/bin/bash

# List namespaces
kubectl get ns 

# We can create example namespace where we will operate
kubectl create ns pod-example

# Change config to that namespace 
kubectl config set-context --current --namespace=pod-example
# or 
kubens pod-example

# List all pods in the namespace
kubectl get pods
kubectl get pod
kubectl get po

# Run nginx container as a pod in our namespace
kubectl run nginx-pod --image=nginx --port 80

# For now just port-forward the nginx to our local pc
kubectl port-forward nginx-pod 8080:80

# check localhost:8080

# Delete the pod
kubectl delete pod nginx
# Move context to default ns 
kubens default
# Delete ns 
kubectl delete ns pod-example