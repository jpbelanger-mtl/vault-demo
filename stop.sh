#!/bin/sh

kubectl delete -f vault-dev.yaml
kubectl delete -f consul.yaml
kubectl delete -f mysql.yaml
