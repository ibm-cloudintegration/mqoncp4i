#! /bin/bash

#Use storage class ibmc-file-gold-gid when running on ROKS clusters
#Use storage class managed-nfs-storage when running on CoC PoT clusters
#mq00 reserved for instructor
export TARGET_NAMESPACE=cp4i-mq
export QMpre=mq00
export QMnamea=mq00a
export CONNAMEa=mq00a-ibm-mq
export SERVICEa=mq00a-ibm-mq
export CHANNELa=mq00chla
export TOCLUSa=TO_UNICLUS_mq00a
export QMnameb=mq00b
export CONNAMEb=mq00b-ibm-mq
export SERVICEb=mq00b-ibm-mq
export CHANNELb=mq00chlb
export TOCLUSb=TO_UNICLUS_mq00b
export QMnamec=mq00c
export CONNAMEc=mq00c-ibm-mq
export SERVICEc=mq00c-ibm-mq
export CHANNELc=mq00chlc
export TOCLUSc=TO_UNICLUS_mq00c
export UNICLUS=UNICLUS00
#export SC=ibmc-file-gold-gid
#export SC=managed-nfs-storage
export SC=ocs-storagecluster-cephfs
export LICENSE=L-RJON-CD3JKX
#export VERSION=9.3.0.1-r4
export VERSION=9.3.0.1-r2

( echo "cat <<EOF" ; cat unicluster.yaml_template ; echo EOF ) | sh > unicluster.yaml

oc apply -f unicluster.yaml  -n $TARGET_NAMESPACE
