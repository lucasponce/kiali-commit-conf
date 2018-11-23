ISTIO_NS="istio-system"

BOOKINFO_NS="bookinfo"

oc new-project $BOOKINFO_NS
oc adm policy add-scc-to-user privileged -z default -n $BOOKINFO_NS
oc adm policy add-scc-to-user anyuid -z default -n $BOOKINFO_NS
oc label namespace bookinfo istio-injection=enabled