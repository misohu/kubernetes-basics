#!/bin/bash
docker build -t misohu/django-school-project:sqlite .
docker run --rm -p 8000:8000 misohu/django-school-project:sqlite
docker exec -ti a80ebd9d01cc python manage.py migrate

# check the http://localhost:8000/school/ for the api

docker login  # to login to your dockerhub registry or any other
docker push misohu/django-school-project:sqlite
