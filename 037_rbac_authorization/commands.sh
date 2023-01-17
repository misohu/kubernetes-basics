#!/usr/bin/bash

# Check if user michal can view pods 
kubectl auth can-i list pods --namespace=default --as=michal

# Create role (inspect the file)
kubectl apply -f pod-viewer-role.yaml
# Create role binding for this role
kubectl apply -f pod-viewer-role-binding.yaml

# Check if user michal can view pods 
kubectl auth can-i list pods --namespace=default --as=michal

kubectl auth can-i create namespace --as=michal

