#!/bin/bash

# lets deploy deployment manifest 
kubectl create ns deployment-example
kubens deployment-example

kubectl apply -f nginx-deployment.yaml

# check the replicasets and deployments
kubectl get deploy
kubectl get rs

# now change the image to nginx:1.22 and reapply
kubectl apply -f nginx-deployment.yaml

# check the replicasets
kubectl get rs