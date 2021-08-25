#! /bin/bash

#mq00 reserved for instructor
export TARGET_NAMESPACE=chopper14
#export TARGET_NAMESPACE=wedge4	
export QMname=mq64pl
export LABEL="tekton.dev/task=deploy-qm"

oc delete queuemanager $QMname -n $TARGET_NAMESPACE
oc delete secret mqcert-secret -n $TARGET_NAMESPACE
oc delete route el-el-cicd-mq-hook-route -n $TARGET_NAMESPACE
oc delete task deploy-qm -n $TARGET_NAMESPACE
oc delete eventlistener el-cicd-mq -n $TARGET_NAMESPACE
oc delete pipeline mq-pipeline -n $TARGET_NAMESPACE
oc delete pod -l $LABEL -n $TARGET_NAMESPACE
