#! /bin/bash

export TARGET_NAMESPACE=cp4i-mq
export QMname=mq00mi
export QMpre=mq00
export ROUTE=mq00chl.chl.mq.ibm.com
export CHANNEL=mq00chl

( echo "cat <<EOF" ; cat mqmultiinstance-coc.yaml_template ; echo EOF ) | sh > mqmultiinstance-coc.yaml

oc apply -f mqmultiinstance-coc.yaml
