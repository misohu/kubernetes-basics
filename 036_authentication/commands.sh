#!/bin/bash

# You can read content of the kubeconfig and decode it to find out info
cat ~/.kube/config | grep certificate-authority-data | cut -f2 -d : | tr -d ' '  | base64 -d | openssl x509 -text -out -

# For every pod the authorisation information is mounted 
kubectl run nginx --image nginx --port 80

# List contents of the mount 
kubectl exec -ti nginx -- ls /var/run/secrets/kubernetes.io/serviceaccount 

# Read the certificate 
kubectl exec -ti nginx -- cat /var/run/secrets/kubernetes.io/serviceaccount/ca.crt | openssl x509 -text -out -

# You can create your own service account and associated token
kubectl create serviceaccount michal-sa
kubectl create token michal-sa


# New user setup 

# Create key for the new user
openssl genrsa -out michal.key 2048

# create configuration file for the request 
# check the crs.cnf
# CN is the usernam
# O are groups 

# generate csr
# openssl req -config ./csr.cnf -new -key michal.key -nodes -out michal.csr 
openssl req -new -key michal.key \
  -out michal.csr \
  -subj "/CN=michal"

# now encode the request and put it to michal-csr.yaml
export BASE64_CSR=$(cat ./michal.csr | base64 | tr -d '\n')
cat michal-csr.yaml | envsubst | kubectl apply -f -

# check the csr
kubectl get csr 

# APPROVE   
kubectl certificate approve michal-csr

# Now we can get crt
kubectl get csr michal-csr -o jsonpath='{.status.certificate}' \
| base64 --decode > michal.crt

# Add new user to kubeconfgi
kubectl config set-credentials michal --client-key=michal.key --client-certificate=michal.crt --embed-certs=true

# Add new context
kubectl config set-context michal --cluster=microk8s-cluster --user=michal

# change context
kubectx michal

# Try to list pods in default namespace
kubectl get po  # this will fail 

# Change back to microk8s context to fix authorisation
kubectx microk8s