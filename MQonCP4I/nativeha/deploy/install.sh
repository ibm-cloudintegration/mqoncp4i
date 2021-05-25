#! /bin/bash

#export TARGET_NAMESPACE=cp4i
export TARGET_NAMESPACE=mq00
export VERSION=9.2.2.0-r1
export SC=ibmc-file-gold-gid

( echo "cat <<EOF" ; cat nativeha.yaml_template ; echo EOF ) | sh > nativeha.yaml

oc apply -f nativeha.yaml
