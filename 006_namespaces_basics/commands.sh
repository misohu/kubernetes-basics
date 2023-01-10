#!/bin/bash

# List currently abvailabe namespaces
kubectl get namespace
kubectl get namespaces
kubectl get ns

# Get details of the namespaces
# Most important is the kube-system where all the core components resides
# To get deils about ns you can use describe
kubectl describe namespace <name>
# Resource quota and limit range are the restrictions on resource usage of the namesapce 

# To create new namespace (imperative)
kubectl create namesapce test

# You can get detailed object of the namespace (or any resource with)
kubectl get ns test -o yaml

# To delete a namesapce 
kubectl delete ns test