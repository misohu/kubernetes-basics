#!/bin/bash

kubectl apply -f statefulset.yaml
kubectl apply -f service.yaml
kubectl run dns-check --image=registry.k8s.io/e2e-test-images/jessie-dnsutils:1.3 --command -- sleep "infinity"

kubectl get po -o wide
kubectl exec -ti dns-check -- nslookup web-0.nginx 
kubectl exec -ti dns-check -- nslookup web-1.nginx
kubectl exec -ti dns-check -- nslookup web-2.nginx

# delte stateful set
# delete pvcs 
# delete pvs