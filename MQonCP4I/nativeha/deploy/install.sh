#! /bin/bash

#mq00 reserved for instructor
#export TARGET_NAMESPACE=mq00
export TARGET_NAMESPACE=cp4i
export QMname=mq00ha
export CHANNEL=mq00hachl
export CHLCAPS=MQ00HACHL
export VERSION=9.2.2.0-r1
#export SC=managed-nfs-storage
export SC=ibmc-file-gold-gid

( echo "cat <<EOF" ; cat nativeha.yaml_template ; echo EOF ) | sh > nativeha.yaml

oc apply -f nativeha.yaml
