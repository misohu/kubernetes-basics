#!/bin/bash

# deploy first version 
kubectl apply -f version1.yaml

# now service 
kubectl apply -f servcice.yaml

# port forward 
kubectl port-forward services/nginx 8000:80

# now update deployment 
kubectl apply -f version2.yaml