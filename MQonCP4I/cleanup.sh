#! /bin/bash

#export TARGET_NAMESPACE=cp4i
export TARGET_NAMESPACE=mq00

oc delete queuemanager nativeha -n $TARGET_NAMESPACE
oc delete secret nativehacert -n $TARGET_NAMESPACE
oc delete configmap nativehamqsc -n $TARGET_NAMESPACE
oc delete pvc data-nativeha-ibm-mq-0 -n $TARGET_NAMESPACE
oc delete pvc data-nativeha-ibm-mq-1 -n $TARGET_NAMESPACE
oc delete pvc data-nativeha-ibm-mq-2 -n $TARGET_NAMESPACE
