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
URL1="https://raw.githubusercontent.com/spotahome/redis-operator/$VERSION/manifests/databases.spotahome.com_redisfailovers.yaml"
URL2="https://raw.githubusercontent.com/spotahome/redis-operator/$VERSION/example/operator/all-redis-operator-resources.yaml"

# Create directory
mkdir ${DIR}/${VERSION}
cd ${DIR}/${VERSION}

#wget ${URL1}
wget ${URL1}
wget ${URL2}

cd ${DIR}/${VERSION} && kustomize create --autodetect