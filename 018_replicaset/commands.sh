#!/bin/bash

# Get all current
kubectl get replicaset

# Create replicaset form manifest
kubectl apply -f nginx-replicaset.yaml

# Now we have 2 instances of nginx with name + UID
# examine pods you can port forward each of them. They will be same

# Now we want to have 4 nginxes
# correct way is to update the yaml and again apply 
# this will update existing rs 
# however you can do it imperatively 
kubectl scale replicaset nginx-rs --replicas 3

# check what happen when you deete manualy a pod
kubectl delete po <podname>