#! /bin/bash

#mq00 reserved for instructor
#export TARGET_NAMESPACE=mq00
export TARGET_NAMESPACE=cp4i-mq
export QMname=mq99ha
export VERSION=9.2.2.0-r1
#export SC=managed-nfs-storage
export SC=ibmc-file-gold-gid

( echo "cat <<EOF" ; cat nativeha.yaml_template ; echo EOF ) | sh > nativeha.yaml

oc apply -f nativeha.yaml
