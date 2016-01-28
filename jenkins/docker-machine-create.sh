#!/bin/bash

source ../scripts/util.sh

check-vars "AWS_ACCESS_KEY_ID" \
           "AWS_SECRET_ACCESS_KEY" \
           "AWS_ZONE" \
           "AWS_VPC_ID"

docker-machine create --driver amazonec2 jenkins-master
