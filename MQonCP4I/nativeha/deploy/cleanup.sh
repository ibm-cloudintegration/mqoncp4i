#! /bin/bash

#mq00 reserved for instructor
#export TARGET_NAMESPACE=mq00
export TARGET_NAMESPACE=cp4i-mq
export QMname=mq00ha

oc delete queuemanager $QMname -n $TARGET_NAMESPACE
oc delete secret nativehacert -n $TARGET_NAMESPACE
oc delete configmap nativehamqsc -n $TARGET_NAMESPACE
oc delete pvc mq00ha-ibm-mq-0 -n $TARGET_NAMESPACE
oc delete pvc mq00ha-ibm-mq-1 -n $TARGET_NAMESPACE
oc delete pvc mq00ha-ibm-mq-2 -n $TARGET_NAMESPACE
