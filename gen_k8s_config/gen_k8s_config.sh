#!/bin/bash
#Generate auth config file
set -x

SERVER="https://52FB95AFC0836D6DBF7B7AE49E0B24C6.yl4.eu-central-1.eks.amazonaws.com"
USER="war-deploy"
NS="war"
NAME="dev"

#read -e -p "Input addr server (exp: https://***): " SERVER
#read -e -p "Input user (exp: eks-admin): " USER
#read -e -p "Input Name Space (exp: kube-system): " NS
#read -e -p "Input Cluster Name (exp: war-dev-frankfurt): " NAME


SECRET=$(kubectl --context $NAME -n $NS get secret | grep $USER | awk '{print $1}')
TOKEN=$(kubectl --context $NAME get secret $SECRET -n $NS -o "jsonpath={.data.token}" | base64 -D)
CERT=$(kubectl --context $NAME get secret $SECRET -n $NS -o "jsonpath={.data['ca\.crt']}")

echo "apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: $CERT
    server: $SERVER
  name: $NAME
contexts:
- context:
    cluster: $NAME
    namespace: $NS
    user: $USER
  name: $NAME
current-context: $NAME
kind: Config
preferences: {}
users:
- name: $USER
  user:
    client-key-data: $CERT
    token: $TOKEN" > ~/.kube/config_${USER}_${NAME}

#ln -s -f ~/.kube/config_$NAME ~/.kube/config
