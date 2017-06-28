#!/bin/sh

kubectl create -f consul.yaml
kubectl create -f mysql.yaml
kubectl create -f vault-dev.yaml
