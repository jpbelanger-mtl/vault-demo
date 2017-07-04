#!/bin/bash

export CONSUL_HTTP_ADDR=`minikube ip`:30500
export CONSUL_HTTP_TOKEN=773a3b77-4bfa-4fe3-b643-52f6f6a4af3c

echo "Pushing kube-pod-decorator config for vault-demo-injection"
cat /opt/dev/workspace/vault-demo/examples/consul/vault-demo-injection.yaml | consul kv put config/kube-pod-decorator/vault-demo-injection/config -

echo "Pushing simple json config to consul"
cat /opt/dev/workspace/vault-demo/examples/consul/cluster-info.json | consul kv put config/cluster-info -

echo "Pushing flat file to consul"
cat /opt/dev/workspace/vault-demo/examples/consul/files/example_config.yaml | consul kv put config/kube-pod-decorator/vault-demo-injection/files/example_config.yaml -

echo "Pyshing go template to consul"
cat /opt/dev/workspace/vault-demo/examples/consul/templates/application.yaml | consul kv put config/kube-pod-decorator/vault-demo-injection/templates/application.yaml -
