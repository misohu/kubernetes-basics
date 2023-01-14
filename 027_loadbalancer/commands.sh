#!/bin/bash
# Lets reset microk8s to have the same env
# First check kubectl get nodes -o wide to check your ipaddress range 
sudo snap remove microk8s --purge
sudo snap install microk8s --classic --channel=1.26     # or whiocever version you want to use
microk8s enable metallb:192.168.100.40-192.168.100.50   # Set there some reasonable iprange 

# regenerate config
microk8s config > ~/.kube/config

# Create ns
kubectl create ns loadbalancer-test

# Create nginx
kubectl run nginx --image=nginx --port=80

# Expose as LoadBalancer
kubectl expose pod nginx --port 80 --target-port 80 --type LoadBalancer

