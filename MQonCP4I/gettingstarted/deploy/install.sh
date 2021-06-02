#! /bin/bash

export TARGET_NAMESPACE=cp4i-mq
export VERSION=9.2.2.0-r1

( echo "cat <<EOF" ; cat gettingstartedqmgr.yaml_template ; echo EOF ) | sh > gettingstartedqmgr.yaml

oc apply -f gettingstartedqmgr.yaml
