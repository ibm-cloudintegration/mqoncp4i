#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
export MQCCDTURL="${DIR}/ccdt_generated.json"
export MQSSLKEYR="${DIR}/key"
export MQCHLLIB="${DIR}"
export MQCHLTAB="${DIR}/ccdt_generated.json"
export TARGET_NAMESPACE=cp4i-mq
export QMpre=MQ00
export QMname=nativeha
export APPQ=APPQ

export ROOTURL="$(oc get IngressController default -n openshift-ingress-operator -o jsonpath='{.status.domain}')"
( echo "cat <<EOF" ; cat ccdt_template.json ; echo EOF ) | sh > ccdt_generated.json

for (( i=0; i<$1; ++i)); do
  echo "Starting amqsphac" $QMname
  /opt/mqm/samp/bin/amqsphac $APPQ $QMname &
done
