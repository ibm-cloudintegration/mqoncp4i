#! /bin/bash

#mq00 reserved for instructor
#export TARGET_NAMESPACE=cp4i-mq
export TARGET_NAMESPACE=cp4i-mq
export QMname=mq00ha
export VERSION=9.2.2.0-r1
#export SC=ibmc-file-gold-gid
export SC=managed-nfs-storage

( echo "cat <<EOF" ; cat nativeha.yaml_template ; echo EOF ) | sh > nativeha.yaml

oc apply -f nativeha.yaml
