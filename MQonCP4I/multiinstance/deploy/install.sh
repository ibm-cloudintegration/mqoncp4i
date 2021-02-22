#! /bin/bash

export TARGET_NAMESPACE=cp4i-mq
export QMname=mq00mi
export QMpre=mq00
export ROUTE=mq00
chl.chl.mq.ibm.com
export CHANNEL=mq0chl

( echo "cat <<EOF" ; cat mqmultiinstance.yaml_template ; echo EOF ) | sh > mqmultiinstance.yaml

oc apply -f mqmultiinstance.yaml
