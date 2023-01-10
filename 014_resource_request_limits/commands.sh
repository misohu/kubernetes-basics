#!/bin/bash

# You can check the cluster capacity by checking each node 
kubectl describe node <name>

# Schedule a pod to a node with resource constraints
kubectl apply -f school-pod.yaml

# You ca try to delete the pod and overshoot the request .. 
# Pod wont be scheduled and will stuck in Pending