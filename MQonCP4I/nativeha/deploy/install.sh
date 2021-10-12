#! /bin/bash

#Use storage class ibmc-file-gold-gid when running on ROKS clusters
#Use storage class managed-nfs-storage when running on CoC PoT clusters
#mq00 reserved for instructor
export TARGET_NAMESPACE=cp4i-mq
export QMname=mq00ha
export CHANNEL=mq00hachl
export CHLCAPS=MQ00HACHL
export VERSION=9.2.3.0-r1
export SC=managed-nfs-storage
#export SC=ibmc-file-gold-gid

( echo "cat <<EOF" ; cat nativeha.yaml_template ; echo EOF ) | sh > nativeha.yaml

oc apply -f nativeha.yaml
