#! /bin/bash

export TARGET_NAMESPACE=cp4i-mq
export QMname=mq00mi
export QMpre=mq00

oc delete queuemanager $QMpre-multiinstancemq -n $TARGET_NAMESPACE
oc delete secret $QMpre-multiinstancecert -n $TARGET_NAMESPACE
oc delete route $QMpre-mq-traffic-mq-multiinstance-ibm-mq-qm -n $TARGET_NAMESPACE
oc delete configmap $QMpre-mqmultiinstancemqsc -n $TARGET_NAMESPACE
oc delete pvc data-$QMpre-multiinstancemq-ibm-mq-0 -n $TARGET_NAMESPACE
oc delete pvc data-$QMpre-multiinstancemq-ibm-mq-1 -n $TARGET_NAMESPACE
oc delete pvc $QMpre-multiinstancemq-ibm-mq-persisted-data -n $TARGET_NAMESPACE
oc delete pvc $QMpre-multiinstancemq-ibm-mq-recovery-logs -n $TARGET_NAMESPACE
rm mqmultiinstance.yaml
