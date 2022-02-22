#!/bin/bash

# Get release for version

# Current dir
DIR="$( cd "$( dirname "$0" )" && pwd )"

# Check input
if [ -z ${1+x} ]
then
  echo "Require a version"
  exit 1
else
  VERSION=${1}
fi

# Construct download URL
#URL1="https://raw.githubusercontent.com/zalando/postgres-operator/$VERSION/manifests/configmap.yaml"
URL2="https://raw.githubusercontent.com/zalando/postgres-operator/$VERSION/manifests/operator-service-account-rbac.yaml"
URL3="https://raw.githubusercontent.com/zalando/postgres-operator/$VERSION/manifests/postgres-operator.yaml"
URL4="https://raw.githubusercontent.com/zalando/postgres-operator/$VERSION/manifests/api-service.yaml"

# Create directory
mkdir ${DIR}/${VERSION}
cd ${DIR}/${VERSION}

#wget ${URL1}
wget ${URL2}
wget ${URL3}
wget ${URL4}

cd ${DIR}/${VERSION} && kustomize create --autodetect