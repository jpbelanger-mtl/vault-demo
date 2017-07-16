#! /bin/bash
mysql --protocol=tcp --host=`minikube ip` --port=30306 -u root -ppassword -e "select * from mysql.user where User like 'v%'"
