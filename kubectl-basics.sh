#!/bin/bash

kubectl version                     # get the version of local client and API server (remote)
kubectl get componentstatuses       # get the status of most important components (etcd is missing for microk8s)
kubectl get nodes                   # get the current nodes of the cluster controll-plane/master is the main node

# kubernetes wont generally schedule on master if we dont specify else. In case of microk8s our workloads will be scheduled to master

kubectl describe nodes <node-name>  # get detailed information about certain node. Check the labels for node info

kubectl get pod                     # get all pods in current context 
kubectl get pod -o yaml             # get all pods in current context namespace in yaml format
kubectl get pod --no-headers        # get human readable output without header

kubectl config set-context --current --namespace=kube-system    # this will change the current namespace for current context
kubens                              # list all available namespaces
kubens <namespace>                  # change current namespace

kubectl apply -f nginx.yaml         # create/update object based on manifest in nginx.yaml
kubectl edit pod nginx-pod          # live edit of the pod 
kubectl delete pod nginx-pod        # remove the pod from cluster

# labels 
kubectl label pods nginx-pod owner=michal   # add owner label with value michal to the pod 
kubectl label pods nginx-pod owner-         # remove label owner from pod

# logs
kubectl logs nginx-pod                      # get the application logs from pod
kubectl logs -f nginx-pod                   # get continuous logs from pod  (end with ctrl + c)
kubectl logs -f nginx-pod -c nginx          # get logs from pod from specific container
kubectl top nodes                           # get the resource usage for nodes (metrics server must be installed)

# accesing the container
kubectl exec -ti nginx-pod -- bash                                  # there is space after two dashes. This will execute command on running contianer 
                                                                    # sometimes the bash may not be present so try sh or /bin/bash
kubectl cp nginx-pod:/etc/nginx/conf.d/default.conf ./default.conf  # get the file from running pod (works also other way arround) 
kubectl port-forward nginx-pod 8080:80                              # by default the container is not accessible to the local machine

# working with different namespaces 
kubectl get po -n different-namespace       # get the pods from different-namespace
kubectl get po --all-namespaces             # get pods from all-namespaces
kubectl get all                             # get all resources in current namespace
kubectl get all --all-namespaces            # get all resources in all namespaces