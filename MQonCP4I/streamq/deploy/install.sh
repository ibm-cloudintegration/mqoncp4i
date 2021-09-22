#! /bin/bash

#mq99 reserved for instructor
export TARGET_NAMESPACE=cp4i-mq
export QMname=mq99strm
export QMpre=mq99
export ROUTE=mq99strmchl.chl.mq.ibm.com
export CHANNEL=mq99strmchl
export CHLCAPS=mq99STRMCHL
export VERSION=9.2.3.0-r1
export SC=ibmc-file-gold-gid
#export SC=managed-nfs-storage

( echo "cat <<EOF" ; cat streamq.yaml_template ; echo EOF ) | sh > streamq.yaml

oc apply -f streamq.yaml
