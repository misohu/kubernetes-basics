#!/bin/bash

# First lets deploy our docker image 
kubectl run school-pod --image=misohu/django-school-project:sqlite --port 8000

# Hmm but we might want to run migrate before running the server 
kubectl run school-pod --image=misohu/django-school-project:sqlite --port 8001 --command -- /bin/bash -c "python manage.py migrate; python manage.py runserver 0.0.0.0:8001"

# You can do the same thing with manifest
school-pod.yaml
# So kubernetes command overrides DOckers ENTRYPOINT
# You can also specify spec.containers[0].args which overrides Docker's CMD section 

# Please remember that pod is ephemeral and db is sqlite stored in pods filesystem which is discarted after restart

# A word about kubectl edit
# You can live edit some of your resources
kubectl edit po school-pod
