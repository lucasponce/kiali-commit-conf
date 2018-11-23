#!/bin/sh
PRODUCTPAGE="http://productpage:9080/productpage"
while true
do
	RESULT=$(curl -H "${REGION}" -o /dev/null -s -w %{http_code}\n ${PRODUCTPAGE})
	echo "Watching ${REGION} ${PRODUCTPAGE} => $RESULT"	
	sleep 1
done
