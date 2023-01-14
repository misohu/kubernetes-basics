#!/bin/bash

# label at creation
kubectl run nginx-blue-1 --image=nginx --labels color=blue
kubectl run nginx-blue-2 --image=nginx --labels color=blue
kubectl run nginx-red-1 --image=nginx --labels color=red
kubectl run nginx-red-2 --image=nginx --labels color=red
kubectl run nginx-combined --image=nginx --labels="color=blue,misohu/size=small"

# label modification 
kubectl label pod nginx-blue-2 "misohu/size=big"
kubectl label pod nginx-blue-1 color-

kubectl get po --show-labels
kubectl get po -L color

# Select by label
kubectl get po --selector "color=blue,misohu/size=small"
kubectl get po --selector "color=blue,misohu/size in (small, big)"