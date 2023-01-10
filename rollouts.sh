kubectl apply -f deployment.yaml

# check the revision in annotation 
kubectl get deploy nginx -o yaml

# scale update
kubectl scale deploy --replicas=3

# check the revision in annotation (did not change)
kubectl get deploy nginx -o yaml

# change for example annotation or image or anything
# add kubernetes.io/change-cause: annotation to template with some text
kubectl apply -f deployment.yaml

# check the revision in annotation 
kubectl get deploy nginx -o yaml

kubectl rollout history deployment nginx

kubectl rollout pause deployment nginx 
kubectl rollout resume deployment nginx 
# check details about particular revision
kubectl rollout history deployment nginx --revision=2
# rollout to specific revision
kubectl rollout undo deployments nginx --to-revision=3
# if revision == 0 its like undo 