#!/bin/bash

# Before using the hostpath lets enable host storage for the microk8s 
microk8s enable hostpath-storage

# Now You can check the storage class
kubectl get storageclass microk8s-hostpath -o yaml

