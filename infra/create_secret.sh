#!/bin/bash

SECRET_NAME="moov-secret"

export $(sops -d secret.env | xargs)

kubectl -n=moov delete secret ${SECRET_NAME} 2> /dev/null
kubectl -n=moov \
create secret generic ${SECRET_NAME} \
--from-literal="DB_HOST=$DB_HOST" \
--from-literal="DB_USER=$DB_USER" \
--from-literal="DB_PASSWORD=$DB_PASSWORD" \
--from-literal="DB_NAME=$DB_NAME" \
--from-literal="DB_PORT=$DB_PORT" \
--from-literal="POSTGRES_PASSWORD=$DB_PASSWORD" \
--from-literal="POSTGRES_USER=$DB_USER" \
--from-literal="POSTGRES_DB=$DB_NAME" \
--from-literal="JWT_SECRET=$JWT_SECRET" \
--from-literal="JWT_REFRESH_SECRET=$JWT_REFRESH_SECRET" \
--from-literal="EMAIL=$EMAIL" \
--from-literal="EMAIL_PASSWORD=$EMAIL_PASSWORD" \
--from-literal="VITE_MAPS_API_KEY=$VITE_MAPS_API_KEY"
