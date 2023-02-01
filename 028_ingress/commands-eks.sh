#!/bin/bash
# Full procedure here https://docs.aws.amazon.com/eks/latest/userguide/aws-load-balancer-controller.html
sudo snap install helm --classic

eksctl utils associate-iam-oidc-provider \
    --region eu-central-1 \
    --cluster kubernetes-course \
    --approve

# this for alal regions except AWS GovCloud (US-East) or AWS GovCloud (US-West) AWS Regions
curl -O https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.4.4/docs/install/iam_policy.json

# create the policy
aws iam create-policy \
    --policy-name AWSLoadBalancerControllerIAMPolicy \
    --policy-document file://iam_policy.json

# creeate the role 
# get the account ID from the console 
eksctl create iamserviceaccount \
  --cluster=kubernetes-course \
  --namespace=kube-system \
  --name=aws-load-balancer-controller \
  --role-name AmazonEKSLoadBalancerControllerRole \
  --attach-policy-arn=arn:aws:iam::111122223333:policy/AWSLoadBalancerControllerIAMPolicy \
  --approve

# add helm repo
helm repo add eks https://aws.github.io/eks-charts

# update repo
helm repo update

# install helm 
# image codes per region are here https://docs.aws.amazon.com/eks/latest/userguide/add-ons-images.html
helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
  -n kube-system \
  --set clusterName=kubernetes-course \
  --set serviceAccount.create=false \
  --set serviceAccount.name=aws-load-balancer-controller \
  --set image.repository=602401143452.dkr.ecr.eu-central-1.amazonaws.com/amazon/aws-load-balancer-controller

# verify
kubectl get deployment -n kube-system aws-load-balancer-controller

# In aws ingres controller the svcs must be nodeports
kubectl expose deployment school-project --port 8000 --target-port 8000 --type=NodePort
kubectl expose deployment nginx --port 80 --target-port 80 --type=NodePort
kubectl expose deployment apache --port 80 --target-port 80 --type=NodePort

# Use this extension to modify the headers https://chrome.google.com/webstore/detail/modheader-modify-http-hea/idgpnmonknjnojddfkpgkljpfnnfcklj/related
