#!/bin/bash

source ../scripts/util.sh

export CLOUDSDK_CORE_DISABLE_PROMPTS=1

curl https://sdk.cloud.google.com | bash || true

source ~/.bash_profile &> /dev/null || true

gcloud components install kubectl

gcloud container clusters create sgoings-deis-test

curl -s https://get.helm.sh | bash


rm ~/.helm/
./helm update
./helm repo add github.com/deis/charts
./helm fetch deis/deis
./helm install deis

kubectl --namespace=deis get pods -w

kubectl get svc --namespace deis -o yaml deis-router

curl -sSL http://deis.io/deis-cli/install-v2-alpha.sh | bash

./deis register http://deis.10.4.197.185.229.xip.io
