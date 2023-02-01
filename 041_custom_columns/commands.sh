#!/bin/bash

kubectl apply -f pods.yanl

# Create custom columns for PodName Image and Labels
kubectl get po -o='custom-columns=PodName:.metadata.name,Image:.spec.containers[0].image,Labels:.metadata.labels'