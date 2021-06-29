#!/bin/bash

#mq00 reserved for instructor
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
export MQCCDTURL="${DIR}/ccdt_generated.json"
export MQSSLKEYR="${DIR}/key"
export MQCHLLIB="${DIR}"
export MQCHLTAB="${DIR}/ccdt_generated.json"
export TARGET_NAMESPACE=cp4i
export QMpre=mq00
export QMname=mq00ha
export CHLCAPS=MQ00HACHL
export APPQ=APPQ

export ROOTURL="$(oc get IngressController default -n openshift-ingress-operator -o jsonpath='{.status.domain}')"
( echo "cat <<EOF" ; cat ccdt_template.json ; echo EOF ) | sh > ccdt_generated.json

echo "Starting amqsghac" $QMname
/opt/mqm/samp/bin/amqsghac $APPQ $QMname
