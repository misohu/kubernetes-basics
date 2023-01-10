# creation from cmd line
kubectl create configmap test-cm \
    --from-file=config.txt \
    --from-literal=new-var=value \
    --from-literal=new-var-2=value

# create secrets
kubectl create secret generic test-secret \
    --from-literal=username=michal \
    --from-literal=password=password

# imagePullSecrets in the pod spec can help to get the images from private registry
kubectl create secret docker-registry my-image-pull-secret \
--docker-username=<username> \
--docker-password=<password> \
--docker-email=<email-address>

# configmap/secret recreation trick (if data is stored in the file)
kubectl create secret generic app-tls \
--from-file=file.crt --from-file=file.key \
--dry-run -o yaml | kubectl replace -f -
