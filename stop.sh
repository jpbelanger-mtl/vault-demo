#!/bin/sh

kubectl delete -f k8s-config/vault-dev.yaml
kubectl delete -f k8s-config/consul.yaml
kubectl delete -f k8s-config/mysql.yaml
