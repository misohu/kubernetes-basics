# Download your AWS credentials  https://docs.aws.amazon.com/singlesignon/latest/userguide/howtogetcredentials.html
# Download AWS CLI  https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
# Download EKS CLI  https://docs.aws.amazon.com/eks/latest/userguide/eksctl.html
# You need to have kubectl (from last video)

# Create your first kubernetes cluster 
# Make sure to choose region closest to you (otherwise there might be some response delays)
# Running this command can take up to 25 minutes (prepare some time)
eksctl create cluster --name kubernetes-course --region eu-central-1

# This setup creates 2 EC2 instances and EKS setup (it uses CloudFomration)
# It also populates the config at ~/.kube/config with credentials 
# Test access with 
kubectl get nodes  # commands list virtual machines in the cluster

# To delete the cluster run 
# Also this command can take couple of minuts
eksctl delete cluster --name kubernetes-course --region eu-central-1
