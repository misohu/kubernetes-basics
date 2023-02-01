#!/bin/bash
# Lets reset microk8s to have the same env
# First check kubectl get nodes -o wide to check your ipaddress range 
sudo snap remove microk8s --purge
sudo snap install microk8s --classic --channel=1.26     # or whiocever version you want to use
microk8s enable ingress

# regenerate config
microk8s config > ~/.kube/config

# Lets create separate namespace
kubectl create ns ingress-test
# change the context to the namespace
kubens ingress-test

# Lets first deploy nginx
kubectl create deployment nginx --image=nginx --port 80

# and also deploy apache
kubectl create deployment apache --image=httpd --port 80

# We will deploy also our sqlite app
kubectl apply -f school-project.yaml

# expose the deployments with nodeports
kubectl expose deployment school-project --port 8000 --target-port 8000
kubectl expose deployment nginx --port 80 --target-port 80
kubectl expose deployment apache --port 80 --target-port 80

# deploy ingress 
kubectl apply -f ingress.yaml

# set the local dns resolution 
sudo vim /etc/hosts
# 127.0.0.1  nginx.kubernetes.course
# 127.0.0.1  school.kubernetes.course

# Go to browser



