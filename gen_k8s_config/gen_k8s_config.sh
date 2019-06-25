#!/bin/bash
#Generate auth config file
#set -x

SERVER="https://52FB95AFC0836D6DBF7B7AE49E0B24C6.yl4.eu-central-1.eks.amazonaws.com"
USER="eks-admin"
NS="kube-system"
NAME="dev"

read -e -p "Input addr server (exp: https://***): " SERVER
read -e -p "Input user (exp: eks-admin): " USER
read -e -p "Input Name Space (exp: kube-system): " NS
read -e -p "Input Cluster Name (exp: war-dev-frankfurt): " NAME


SECRET=$(kubectl -n $NS get secret | grep $USER | awk '{print $1}')
TOKEN=$(kubectl get secret $SECRET -n $NS -o "jsonpath={.data.token}" | base64 -D)
CERT=$(kubectl get secret $SECRET -n $NS -o "jsonpath={.data['ca\.crt']}")

echo "apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: $CERT
    server: $SERVER
  name: $NAME
contexts:
- context:
    cluster: $NAME
    namespace: default
    user: eks-admin
  name: $NAME
current-context: $NAME
kind: Config
preferences: {}
users:
- name: eks-admin
  user:
    client-key-data: $CERT
    token: $TOKEN" > ~/.kube/config_$NAME

ln -s -f ~/.kube/config_$NAME ~/.kube/config
