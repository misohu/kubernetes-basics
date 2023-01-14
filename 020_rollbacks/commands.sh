#!/bin/bash

# lets deploy deployment manifest 
kubectl create ns deployment-example
kubens deployment-example

kubectl apply -f nginx-deployment.yaml

# Now we will use set command to change the image of live deployment 
# Be careful as that is an antipattewrn
kubectl set image deploy nginx nginx=nginx:1.22
# The effect is the same as last time 

# Now we can check the rollout history
kubectl rollout history deployment nginx

# We can record the command changing deployment
kubectl set image deploy nginx nginx=nginx:1.21 --record
# Now check the rollout history and see the cause 
kubectl rollout history deployment nginx

# You can achieve the same thing by adding kubernetes.io/change-cause annotation 
# edit deployment and redeploy (set nginx:1.20)
kubectl apply -f nginx-deployment.yaml

# Now examine the pod object check the annotation with history
kubectl get deploy nginx -o yaml 

# Now rollback to previous version 
kubectl rollout undo deployment nginx
# Check how the version three is the increment of our previous version 
# Check the imahe of current pods
# Now rollback to revision 1
kubectl rollout undo deployment nginx --to-revision=1
# try to guess the history table 