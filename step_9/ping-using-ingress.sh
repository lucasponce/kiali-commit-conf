export INGRESS_HOST=$(oc get po -l istio=ingressgateway -n istio-system -o 'jsonpath={.items[0].status.hostIP}')
export INGRESS_PORT=$(oc -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}')

echo "curl -I -HHost:www.productpage.com http://${INGRESS_HOST}:${INGRESS_PORT}/productpage"
curl -I -HHost:www.productpage.com http://${INGRESS_HOST}:${INGRESS_PORT}/productpage
