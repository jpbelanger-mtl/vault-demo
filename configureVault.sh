#!/bin/bash

export VAULT_ADDR=http://`minikube ip`:30200
export VAULT_TOKEN=mysimple-vault-root-token-secret

echo "Configuring consul secret backend"
vault mount consul

vault write consul/config/access address=consul:8500 token=773a3b77-4bfa-4fe3-b643-52f6f6a4af3c
echo 'key "" { policy = "read" }' | base64 | vault write consul/roles/readonly policy=- lease=1h

echo "Configuration MySQL secret backend"
vault mount database
vault write database/config/mysql plugin_name=mysql-database-plugin allowed_roles="readonly" connection_url="root:password@tcp(mysql:3306)/"
vault write database/roles/readonly db_name=mysql default_ttl="1h" max_ttl="24h" creation_statements="CREATE USER '{{name}}'@'%' IDENTIFIED BY '{{password}}';GRANT SELECT ON *.* TO '{{name}}'@'%';"

echo "Configuration generic secret"
vault write secret/foo bar=foo foo=bar ttl=1h

echo "Creating vault-demo-injection policy"
vault policy-write vault-demo-injection /opt/dev/workspace/vault-demo/examples/demo-policy.hcl

echo "Creating unwrapped token for vault-demo-injection (valid 1h)"
vault token-create -display-name="vault-demo-injection" -ttl="1h" -renewable=true -policy="vault-demo-injection" -id=4a9afb73-2125-d5fe-e05d-831f33e00f10
