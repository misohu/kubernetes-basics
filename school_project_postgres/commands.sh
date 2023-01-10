kubectl exec -it postgres-7c5cdd45b-gl5wc --  psql -U admin --password -p 5432 postgresdb

CREATE DATABASE school;
grant all privileges on database school to admin;

kubectl exec -it postgres-7c5cdd45b-gl5wc --  psql -U admin --password -p 5432 postgresdb
\c school
\dt