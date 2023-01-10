#!/bin/bash
sudo snap install kubectl --classic

# check the version of kubectl
kubectl version

# You can find all the other OSses and distros here https://pwittrock.github.io/docs/tasks/tools/install-kubectl/

### WIDOWS 
# If you decided to go with Windows download the binary 
# Place it to dedicated folder e.g.C:\Program Files\kubectl
# Place the folder to the environment variables so you can use it in cmd
# Create the .kube folder in your home directory. Most likely in C:\Users\<User-name>\.kube
# Config is expected to be presented there 

# In order to work with kubectl we need cluster and cluster config
# Everytime we run kubectl command the CLI will search for config by default at
cat ~/.kube/config

# Or if speciffied at KUBECONFIG
export KUBECONFIG=/path/to/config   # to set variable
printenv | grep KUBECONFIG          # to view variable 
# there is also option to always provide path to the config with every cli call whihch we discuss later

# You can combine kubeconfigs we discuss later


