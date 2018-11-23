#!/bin/bash
#
# Copyright 2017 Istio Authors
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

SCRIPTDIR=./destination-rule-header.yaml

ISTIO_PATH="../../istio-1.0.3"

NAMESPACE=bookinfo

echo "using NAMESPACE=${NAMESPACE}"

protos=( destinationrules virtualservices gateways )
for proto in "${protos[@]}"; do
  for resource in $($ISTIO_PATH/bin/istioctl get -n ${NAMESPACE} $proto | awk 'NR>1{print $1}'); do
    $ISTIO_PATH/bin/istioctl delete -n ${NAMESPACE} $proto $resource;
  done
done
#$ISTIO_PATH/bin/istioctl delete mixer-rule ratings-ratelimit

export OUTPUT=$(mktemp)
echo "Application cleanup may take up to one minute"
kubectl delete -n ${NAMESPACE} -f $SCRIPTDIR > ${OUTPUT} 2>&1

ret=$?
function cleanup() {
  rm -f ${OUTPUT}
}

trap cleanup EXIT

if [[ ${ret} -eq 0 ]];then
  cat ${OUTPUT}
else
  # ignore NotFound errors
  OUT2=$(grep -v NotFound ${OUTPUT})
  if [[ ! -z ${OUT2} ]];then
    cat ${OUTPUT}
    exit ${ret}
  fi
fi

echo "Application cleanup successful"