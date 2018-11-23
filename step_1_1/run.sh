ISTIO_NS="istio-system"

BOOKINFO_NS="bookinfo"

istioctl kube-inject -f generators.yaml | oc apply -n $BOOKINFO_NS -f -
