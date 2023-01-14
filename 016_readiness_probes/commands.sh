#!/bin/basah

# deploy the yaml
kubectl apply -f nginx-pod.yaml

# notice how it takes time for the pod to be ready as the readines probe has initalwait time