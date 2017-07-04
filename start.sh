#!/bin/sh

kubectl create -f k8s-config/consul.yaml
kubectl create -f k8s-config/mysql.yaml
kubectl create -f k8s-config/vault-dev.yaml
