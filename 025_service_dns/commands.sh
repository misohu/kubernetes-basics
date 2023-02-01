#!/bin/bash

kubectl create ns deployment-example

# Deploy deployment and expose it 
kubectl apply -f deployment-example.yaml

# Expose deployment
kubectl expose -n deployment-example deployment nginx-deployment --port 8080 --target-port 80

# Now in the same namespace create pod for checking dns records
kubectl run dns-check --image=registry.k8s.io/e2e-test-images/jessie-dnsutils:1.3 --command -- sleep "infinity"

# Query the svc for deployment
kubectl exec -ti dns-check -- nslookup nginx-deployment                     # the address is the address of service
kubectl exec -ti dns-check -- nslookup nginx-deployment.deployment-example

# In this way you can query services in different ns but you need to add the namespace
kubectl exec -ti dns-check -- nslookup kubernetes           # this will not work as we are not in the same ns as the kubernetes svc
kubectl exec -ti dns-check -- nslookup kubernetes.default   # this will work

# You can check the default dns config for the pod (automatically updated by kubelet)
kubectl exec -ti dns-check -- cat /etc/resolv.conf
# nameserver is the ip off kube-dns service in kube-system
kubectl get svc -n kube-system
