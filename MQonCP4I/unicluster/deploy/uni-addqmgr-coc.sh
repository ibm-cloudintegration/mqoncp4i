#! /bin/bash

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

( echo "cat <<EOF" ; cat uniaddqmgr-coc.yaml_template ; echo EOF ) | sh > uniaddqmgr-coc.yaml

oc apply -f uniaddqmgr-coc.yaml  -n $TARGET_NAMESPACE
