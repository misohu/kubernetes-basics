docker build -t misohu/django-school-project:sqlite .
docker push  misohu/django-school-project:sqlite

kubectl run django-app --image misohu/django-school-project:sqlite --port=8000
kubectl run django-app --image misohu/django-school-project:sqlite --port=8001 --command -- /bin/sh -c "python manage.py migrate; python manage.py runserver 0.0.0.0:8001" 
