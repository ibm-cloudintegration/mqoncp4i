#! /bin/bash

#Use storage class ibmc-file-gold-gid when running on ROKS clusters
#Use storage class managed-nfs-storage when running on CoC PoT clusters
#mq00 reserved for instructor
export TARGET_NAMESPACE=cp4i-mq
export QMname=mq00strm
export QMpre=mq00
export ROUTE=mq00strmchl.chl.mq.ibm.com
export CHANNEL=mq00strmchl
export CHLCAPS=mq00STRMCHL
export LICENSE=L-RJON-CD3JKX
#export VERSION=9.3.0.1-r4
export VERSION=9.3.0.1-r2
#export SC=managed-nfs-storage
#export SC=ibmc-file-gold-gid
export SC=ocs-storagecluster-cephfs

( echo "cat <<EOF" ; cat streamq.yaml_template ; echo EOF ) | sh > streamq.yaml

oc apply -f streamq.yaml
