#! /bin/bash

export TARGET_NAMESPACE=cp4i-mq

oc delete queuemanager gsmq -n $TARGET_NAMESPACE
oc delete secret gettingstartedqmgrcert -n $TARGET_NAMESPACE
oc delete route mq-traffic-mq-gettingstartedqmgr-ibm-mq-qm -n $TARGET_NAMESPACE
oc delete configmap gettingstartedmqsc -n $TARGET_NAMESPACE
