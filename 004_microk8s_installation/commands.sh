#!/bin/bash

# First update the registires
sudo apt update
sudo apt upgrade

# Install microk8s with single command. This will install latest snap you can check versions here (top right dropdown with versions) https://snapcraft.io/microk8s
sudo snap install microk8s --classic

# If you want to install version which I am using not latest you can run 
sudo snap install microk8s --channel=1.25/stable --classic 

# (Optional just to know) To uninstall run 
sudo snap remove microk8s --purge

# To check the status of microk8s
microk8s status

# You can start and stop anytime 
microk8s stop
microk8s start

# You can install microk8s addons as follows 
# List of all addons is here https://microk8s.io/docs/addons
# We will need just following ones (you can add addon anytime you want)
microk8s enable rbac dns storage metallb:10.64.140.43-10.64.140.49 ingress

# Microk8s kubeconfig con be obtained with microk8s config
mkdir ~/.kube                       # create .kube directory 
microk8s config > ~/.kube/config    # create config. Now we no longer need to prefix with microk8s.
kubectl version                     # now if you run the command you should see version for client and version for server


