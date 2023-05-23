#! /bin/bash

#Use storage class ibmc-file-gold-gid when running on ROKS clusters
#Use storage class managed-nfs-storage when running on CoC PoT clusters
#mq00 reserved for instructor
export TARGET_NAMESPACE=cp4i-mq
export QMname=mq00mi
export QMpre=mq00
export ROUTE=mq00chl.chl.mq.ibm.com
export CHANNEL=mq00chl
export LICENSE=L-RJON-CD3JKX
#export VERSION=9.3.0.1-r4
export VERSION=9.3.0.1-r2
#export SC=ibmc-file-gold-gid
#export SC=managed-nfs-storage
export SC=ocs-storagecluster-cephfs

( echo "cat <<EOF" ; cat mqmultiinstance.yaml_template ; echo EOF ) | sh > mqmultiinstance.yaml

oc apply -f mqmultiinstance.yaml
