#!/bin/bash

if [ "$#" !=  1  ];then
    echo "Invalid parameters : <environment:discoodle-transverse|sandbox-discoodle|discoodle>"
    exit 0
else
    NAMESPACE=$1
fi

SECRET_NAME="discoodle-secret"

export "$(sops -d secret.env | xargs)"

kubectl -n=moov delete secret ${SECRET_NAME} 2> /dev/null
kubectl -n=moov \
create secret generic ${SECRET_NAME} \
--from-literal="MARIADB_ROOT_USER=$MARIADB_ROOT_USER" \
--from-literal="MARIADB_ROOT_PASSWORD=$MARIADB_ROOT_PASSWORD" \
--from-literal="SPRING_DATASOURCE_USERNAME=$MARIADB_ROOT_USER" \
--from-literal="SPRING_DATASOURCE_PASSWORD=$MARIADB_ROOT_PASSWORD"

echo "added  MARIADB_ROOT_USER=$MARIADB_ROOT_USER"
echo "added  MARIADB_ROOT_PASSWORD=$MARIADB_ROOT_PASSWORD"
echo "added  SPRING_DATASOURCE_USERNAME=$MARIADB_ROOT_USER"
echo "added  SPRING_DATASOURCE_PASSWORD=$MARIADB_ROOT_PASSWORD"
