#!/bin/sh

kubectl create -f consul.yaml
kubectl create -f mysql.yaml
sleep 10
kubectl create -f vault-dev.yaml
