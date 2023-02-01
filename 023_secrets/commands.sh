#!/bin/bash

# We can create configmap from comandline
kubectl create secret generic test-secret --from-literal username=michal --from-literal=password=password --from-file ca.txt

# We can list them
kubectl get secret 

# check yaml
kubectl get secret test-secret -o yaml > test-secret.yaml

# Check that the values for secrets are base64 encoded by default. If you want to create secret from yaml you should use 
# base64 encoded values
echo VGhpcyBpcyBDQQ== | base64 --decode

# inspect the deploymet
# deploy deployemnt 
kubectl apply -f nginx-deployment.yaml
kubectl exec -ti <pod> -- bash

# edit secret
kubectl edit cm test-cm2 

# check the pod again (no change in env, but change in volume file)
kubectl get cm test-cm2 -o yaml > test-cm2.yaml

# docker secrets
kubectl create secret docker-registry my-image-pull-secret \
--docker-username=michal \
--docker-password=password \
--docker-email=itguymichal@gmail.com

# This will create dockerconfigjson entry
kubectl get secret my-image-pull-secret -o yaml



