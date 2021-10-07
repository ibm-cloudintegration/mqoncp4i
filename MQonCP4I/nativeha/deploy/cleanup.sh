#! /bin/bash

#mq00 reserved for instructor
export TARGET_NAMESPACE=cp4i-mq
export QMname=mq00ha

oc delete queuemanager $QMname -n $TARGET_NAMESPACE
oc delete secret nativehacert -n $TARGET_NAMESPACE
oc delete configmap nativehamqsc -n $TARGET_NAMESPACE
oc delete pvc data-$QMname-ibm-mq-0 -n $TARGET_NAMESPACE
oc delete pvc data-$QMname-ibm-mq-1 -n $TARGET_NAMESPACE
oc delete pvc data-$QMname-ibm-mq-2 -n $TARGET_NAMESPACE
oc delete route mq-traffic-mq-$QMname-ibm-mq-qm -n $TARGET_NAMESPACE
