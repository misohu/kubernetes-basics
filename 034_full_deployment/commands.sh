#!/bin/bash
sudo snap install microk8s --classic --channel=1.26
microk8s enable storage dns ingress
microk8s config > ~/.kube/config 

cd docker-image
docker build -t misohu/django-school-project:postgres .
docker push misohu/django-school-project:postgres

cd ../manifests
kubectl apply -f . # can't enforce order so run it twice 
