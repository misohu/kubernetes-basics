#!/bin/bash

# We can create configmap from comandline
kubectl create cm test-cm --from-literal course=kubernetes --from-literal level=beginner
kubectl create cm test-cm2 --from-literal name=michal --from-literal surname=hucko --from-file config-file.txt

# We can list them
kubectl get cm 
kubectl get configmap

# check yaml
kubectl get cm test-cm2 -o yaml > test-cm2.yaml

# inspect the deploymet
# deploy deployemnt 
kubectl apply -f nginx-deployment.yaml
kubectl exec -ti <pod> -- bash

# edit configmap
kubectl edit cm test-cm2 

# check the pod again (no change in env, but change in volume file)
kubectl get cm test-cm2 -o yaml > test-cm2.yaml

# delete configmap 
kubectl delete cm test-cm
kubectl delete cm test-cm2
kubectl delete deployment nginx-deployment



