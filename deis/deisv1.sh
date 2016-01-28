#!/bin/bash

set -eo pipefail

mkdir -p infrastructure
cd infrastructure

if [ ! -d rigger ]; then
  git clone https://github.com/deis/rigger.git
fi

cd rigger

./rigger configure

./rigger provision
