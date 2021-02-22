#! /bin/bash

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

( echo "cat <<EOF" ; cat unicluster.yaml_template ; echo EOF ) | sh > unicluster.yaml

oc apply -f unicluster.yaml  -n $TARGET_NAMESPACE
