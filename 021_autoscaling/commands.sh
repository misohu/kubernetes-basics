#!/bin/bash
microk8s enable metrics-server

# Deploy deployment 
kubectl apply -f apache-deployment.yaml

# Port forward
kubectl port-forward <pod> 8888:80

# Create HPA 
kubectl autoscale deployment php-apache --cpu-percent=50 --min=1 --max=10

# check hpa 
kubectl get hpa

# generate load
while sleep 0.01; do wget -q -O- http://localhost:8888/; done

# check hpa usage this can take couple of minuts
kubectl get hpa

# stop load

# Evaluate the created manifest
kubectl get hpa php-apache -o yaml > hpa.yaml