#! /bin/bash

#Use storage class ibmc-file-gold-gid when running on ROKS clusters
#Use storage class managed-nfs-storage when running on CoC PoT clusters
#mq00 reserved for instructor
export TARGET_NAMESPACE=cp4i-mq
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
export QMpre=mq00
export QMnamed=mq00d
export CONNAMEd=mq00d-ibm-mq
export SERVICEd=mq00d-ibm-mq
export CHANNELd=mq00chld
export TOCLUSd=TO_UNICLUS_mq00d
export UNICLUS=UNICLUS00
export SC=managed-nfs-storage
#export SC=ibmc-file-gold-gid
export VERSION=9.2.3.0-r1

( echo "cat <<EOF" ; cat uniaddqmgr.yaml_template ; echo EOF ) | sh > uniaddqmgr.yaml

oc apply -f uniaddqmgr.yaml  -n $TARGET_NAMESPACE
