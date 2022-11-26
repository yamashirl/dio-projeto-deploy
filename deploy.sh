#!/bin/bash

sed -i "s/DATABASE_IMAGE/$1\/$DATABASE_NAME:$2/" deployments.yml
sed -i "s/BACKEND_IMAGE/$1\/$BACKEND_NAME:$2/" deployments.yml
sed -i "s/FRONTEND_IMAGE/$1\/$FRONTEND_NAME:$2/" deployments.yml

kubectl apply -f deployments.yml

