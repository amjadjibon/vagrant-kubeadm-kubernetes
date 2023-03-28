#!/usr/bin/env bash

set -e

VERSION=1.17.1
REPO_ROOT=$(git rev-parse --show-toplevel)
mkdir -p ${REPO_ROOT}/cluster/istio-operator/operator


if [[ ! -x "$(command -v kubectl)" ]]; then
    echo "kubectl not found"
    exit 1
fi

if [[ ! -x "$(command -v helm)" ]]; then
    echo "helm not found"
    exit 1
fi


curl -sL https://istio.io/downloadIstio | ISTIO_VERSION=${VERSION} sh -

helm template ${REPO_ROOT}/istio-${VERSION}/manifests/charts/istio-operator \
  --set tag=${VERSION} \
  --set enableCRDTemplates=true \
  --set operatorNamespace=istio-operator \
  --set istioNamespace=istio-system  > ${REPO_ROOT}/cluster/istio-operator/operator/manifests.yaml

rm -rf ${REPO_ROOT}/istio-${VERSION}

echo "Istio operator ${VERSION} manifests updated"
