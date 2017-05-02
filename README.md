# vault-demo

##Requirements

- if using the vault-init tool, you need a smtp server. (I used a local postfix docker image in relay mode)
- minikube
- keybase account if you want to use vault in "non dev mode"

## Starting vault

### automated with non-dev mode
- simply run reset-cluster.sh if you have minikube configured as your default context
- then follow the commands.txt doc

### manual with or without dev mode
- kubectl create -f consul.yaml
- kubectl create -f vault-dev.yaml or kubectl create -f vault-cluster.yaml
- kubectl create -f mysql.yaml
