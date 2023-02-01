#!/bin/bash

# get pods with kubectl
kubectlg get po 

# Where is the api located? get it from config
cat ~/.kube/config

# Curling kube-api directly wont work because of SSL (get the ip address from your kubeconfig)
curl https://192.168.100.39:16443/api

# We need authentication method form config (in this case its token for our user)
curl https://192.168.100.39:16443/api --header "Authorization: Bearer <token>" --insecure

# Get the pods from curl for default namespace (get the ip address and token from your kubeconfig)
curl https://192.168.100.39:16443/api/v1/namespaces/<namespace>/pods \
--header "Authorization: Bearer <token>" \
--insecure