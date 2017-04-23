#! /bin/bash

docker stop dev-consul && docker rm dev-consul
docker stop dev-vault && docker rm dev-vault

docker run -d -p 8500:8500 --name=dev-consul --hostname=consul consul agent -server -bootstrap -bind=0.0.0.0 -client=0.0.0.0 -ui
sleep 10s
docker run -d --name=dev-vault --cap-add=IPC_LOCK -p 8200:8200 --link dev-consul:consul -e 'VAULT_LOCAL_CONFIG={"backend":{"consul":{"disable_clustering":"true","address":"consul:8500","path":"vault"}}}' vault

