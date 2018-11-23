ISTIO_NS="istio-system"

BOOKINFO_NS="bookinfo"


istioctl kube-inject -f bookinfo.yaml | oc apply -n $BOOKINFO_NS -f -

oc expose svc productpage