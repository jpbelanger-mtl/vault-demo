#!/bin/sh
eval $(minikube docker-env)

echo "Pulling images"
docker pull vault:0.7.3
docker pull consul:0.8.5
docker pull mysql:latest

kubectl create -f k8s-config/consul.yaml
kubectl create -f k8s-config/mysql.yaml
kubectl create -f k8s-config/vault-dev.yaml
