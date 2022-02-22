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
URL="https://raw.githubusercontent.com/goharbor/harbor-operator/$VERSION/manifests/harbor/deployment.yaml"

# Test if url exists
if ! curl --head --silent --fail ${URL} > /dev/null;
then
  echo "Version ${VERSION} does not exist"
  exit 1
fi

# Create directory
mkdir ${DIR}/${VERSION}
cd ${DIR}/${VERSION}

wget ${URL}
cd ${DIR}/${VERSION} && kustomize create --autodetect