#!/bin/bash

export VAULT_ADDR=http://`minikube ip`:30200
export VAULT_TOKEN=mysimple-vault-root-token-secret

echo "Creating unwrapped token for vault-demo-injection (valid 1h)"
vault token-create -display-name="vault-demo-injection" -ttl="1h" -renewable=true -policy="vault-demo-injection" -id=4a9afb73-2125-d5fe-e05d-831f33e00f10
vault token-create -display-name="vault-demo-injection" -ttl="1h" -renewable=true -policy="vault-demo-injection" -id=4a9afb73-2125-d5fe-e05d-831f33e00f11
