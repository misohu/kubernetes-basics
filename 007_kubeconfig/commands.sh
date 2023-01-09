#!/bin/bash

# Check the current KUBECONFIG variable
printenv | grep KUBECONFIG

# Set KUBECONFIG variable
export KUBECONFIG=/path/to/Files

# Check the current kubeconfig used by kubectl
kubectl config view

# Check the difference with (some fields ere hidden)
cat ~/.kube/config

# You can override kubeconfig for every kubectl command with kubeconfig parameter
kubectl get nodes --kubeconfig=/path/to/file

# Its important to know that by default we always operate on top of namespace speciffied for context 
# We can always change the namespace for current context with 
kubectl config set-context --current --namespace=kube-system    # this will change the current namespace for current context
# now check the config for change

# sometimes this can be cumbersome so I prefer kubectx
sudo snap install kubectx --classic
kubens      # list the available namespaces
kubectx     # list available contexts
kubens X    # change context to namespace x
kubectx Y   # change context to context y

# If you are using the EKS deployment kubeconfig at ~/.kube/config was prepopulated for you
