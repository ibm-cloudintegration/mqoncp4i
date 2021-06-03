#! /bin/bash

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
export QMnamed=mq00d
export CONNAMEd=mq00d-ibm-mq
export SERVICEd=mq00d-ibm-mq
export CHANNELd=mq00chld
export TOCLUSd=TO_UNICLUS_mq00d
export UNICLUS=UNICLUS00

oc delete secret $QMpre-uniform-cluster-cert -n $TARGET_NAMESPACE
oc delete queuemanager $QMnamea -n $TARGET_NAMESPACE
oc delete route mq-traffic-mq-$QMnamea-ibm-mq-qm -n $TARGET_NAMESPACE
oc delete configmap $QMnamea-uniform-cluster-mqsc-1 -n $TARGET_NAMESPACE
oc delete configmap $QMnamea-uniform-cluster-ini-1 -n $TARGET_NAMESPACE
oc delete pvc data-$QMnamea-ibm-mq-0 -n $TARGET_NAMESPACE
oc delete pvc $QMnamea-ibm-mq-persisted-data -n $TARGET_NAMESPACE
oc delete pvc $QMnamea-ibm-mq-recovery-logs -n $TARGET_NAMESPACE
oc delete queuemanager $QMnameb -n $TARGET_NAMESPACE
oc delete route mq-traffic-mq-$QMnameb-ibm-mq-qm -n $TARGET_NAMESPACE
oc delete configmap $QMnameb-uniform-cluster-mqsc-2 -n $TARGET_NAMESPACE
oc delete configmap $QMnameb-uniform-cluster-ini-2 -n $TARGET_NAMESPACE
oc delete pvc data-$QMnameb-ibm-mq-0 -n $TARGET_NAMESPACE
oc delete pvc $QMnameb-ibm-mq-persisted-data -n $TARGET_NAMESPACE
oc delete pvc $QMnameb-ibm-mq-recovery-logs -n $TARGET_NAMESPACE
oc delete queuemanager $QMnamec -n $TARGET_NAMESPACE
oc delete route mq-traffic-mq-$QMnamec-ibm-mq-qm -n $TARGET_NAMESPACE
oc delete configmap $QMnamec-uniform-cluster-mqsc-3 -n $TARGET_NAMESPACE
oc delete configmap $QMnamec-uniform-cluster-ini-3 -n $TARGET_NAMESPACE
oc delete pvc data-$QMnamec-ibm-mq-0 -n $TARGET_NAMESPACE
oc delete pvc $QMnamec-ibm-mq-persisted-data -n $TARGET_NAMESPACE
oc delete pvc $QMnamec-ibm-mq-recovery-logs -n $TARGET_NAMESPACE
oc delete queuemanager $QMnamed -n $TARGET_NAMESPACE
oc delete route mq-traffic-mq-$QMnamed-ibm-mq-qm -n $TARGET_NAMESPACE
oc delete configmap $QMnamed-uniform-cluster-mqsc-4 -n $TARGET_NAMESPACE
oc delete configmap $QMnamed-uniform-cluster-ini-4 -n $TARGET_NAMESPACE
oc delete pvc data-$QMnamed-ibm-mq-0 -n $TARGET_NAMESPACE
oc delete pvc $QMnamed-ibm-mq-persisted-data -n $TARGET_NAMESPACE
oc delete pvc $QMnamed-ibm-mq-recovery-logs -n $TARGET_NAMESPACE
rm unicluster.yaml
