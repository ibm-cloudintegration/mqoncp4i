#! /bin/bash

#mq00 reserved for instructor
export TARGET_NAMESPACE=cp4i-mq
export QMname=mq00mi
export QMpre=mq00
export ROUTE=mq00chl.chl.mq.ibm.com
export CHANNEL=mq00chl
export SC=managed-nfs-storage
export VERSION=9.2.3.0-r1
#export SC=ibmc-file-gold-gid

( echo "cat <<EOF" ; cat mqmultiinstance.yaml_template ; echo EOF ) | sh > mqmultiinstance.yaml

oc apply -f mqmultiinstance.yaml
