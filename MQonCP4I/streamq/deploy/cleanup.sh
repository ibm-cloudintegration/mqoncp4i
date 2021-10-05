#! /bin/bash

#mq99 reserved for instructor
export TARGET_NAMESPACE=cp4i-mq	
export QMname=mq00strm

oc delete queuemanager $QMname -n $TARGET_NAMESPACE
oc delete secret streamqqmgrcert -n $TARGET_NAMESPACE
oc delete configmap streamqmqsc -n $TARGET_NAMESPACE
oc delete route mq-traffic-mq-$QMname-ibm-mq-qm -n $TARGET_NAMESPACE
oc delete pvc data-$QMname-ibm-mq-0 -n $TARGET_NAMESPACE
