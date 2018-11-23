ISTIO_NS="istio-system"

BOOKINFO_NS="bookinfo"


ISTIO_PATH="../../istio-1.0.3"

$ISTIO_PATH/bin/istioctl kube-inject -f destination-rule-header.yaml | oc apply -n $BOOKINFO_NS -f -