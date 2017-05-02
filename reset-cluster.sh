#!/bin/sh

kubectl delete -f vault-cluster.yaml
kubectl delete -f consul.yaml
kubectl delete -f mysql.yaml
sleep 1
kubectl create -f consul.yaml
kubectl create -f vault-cluster.yaml
kubectl create -f mysql.yaml
