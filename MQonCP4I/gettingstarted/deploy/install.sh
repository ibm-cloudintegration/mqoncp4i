#! /bin/bash

export TARGET_NAMESPACE=cp4i-mq
export VERSION=9.3.0.1-r4
export LICENSE=L-RJON-CD3JKX

( echo "cat <<EOF" ; cat gettingstartedqmgr.yaml_template ; echo EOF ) | sh > gettingstartedqmgr.yaml

oc apply -f gettingstartedqmgr.yaml
