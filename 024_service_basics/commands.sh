#!/bin/bash

# first deploy two pods
kubectl run nginx-1 --image=nginx --port 80
kubectl run nginx-2 --image=nginx --port 80

# check ip addresss info 
kubectl get po -o wide 

# try to curl 2 from 1
kubectl exec -ti nginx-1 -- curl <ip>:80

# restart nginx-2 to see ip change
kubectl delete po nginx-2
kubectl run nginx-2 --image=nginx --port 80
# run the same bash command no response

# deletepods 
kubectl delete po nginx-1 nginx-2

# create svc from manifest
kubectl apply -f pods-example.yaml

# curl servicve for nginx1 from nginx2
kubectl exec -ti nginx-2 -- curl http://nginx-1-service:8080

kubectl delete svc nginx-1-service
kubectl delete po nginx-1 nginx-2

#### Deployment example
# Deploy deployment
kubectl apply -f deployment-example.yaml

# expose deployment
kubectl expose deployment nginx-deployment --port 8080 --target-port 80
# check the svc
kubectl get svc nginx-deployment -o yaml

# create extra pod  (this time it does not have curl)
kubectl apply -f busybox.yaml

# test connection to deployment through service 
kubectl exec -ti busybox -- wget -O - nginx-deployment:8080

# If you work on eks you can port forward the proxy 
kubectl proxy --port=8080

# And then access the clusterIP through the browser
http://127.0.0.1:8080/api/v1/proxy/namespaces/loadbalancer-test/services/nginx:80/


