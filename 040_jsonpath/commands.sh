#!/bin/bash

# get all pods in json (check the structure)
kubectl get po -o json

# refer to all results
kubectl get po -o jsonpath='{@}'

# Get all names of the pods 
kubectl get po -o jsonpath='{@.items[*].metadata.name}'

# What is the image of the pod with the name of nginx
kubectl get po -o jsonpath='{@.items[?(@.metadata.name=="nginx")].spec.containers[0].image}'

# For each pod otput a line {name} - {image} dont forget the newline
kubectl get po -o jsonpath='{range @.items[*]}{@.metadata.name} - {@.spec.containers[0].image}{"\n"}{end}'