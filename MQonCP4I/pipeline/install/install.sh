#! /bin/bash

PIPELINE_NS=cp4i-mq
PIPELINE_SA=pipeline

MQ_NS=cp4i-mq
PN_NS=cp4i

GIT_SECRET_NAME=user-at-github

# Insert your Git Access Token below
GIT_TOKEN=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

# Insert your Git UserName here
GIT_USERNAME=jackcarnes

# Create the pipeline namespace
kubectl create ns $PIPELINE_NS

# Change to the new namespace
oc project $PIPELINE_NS

# create the git secret
# oc secret new-basicauth $GIT_SECRET_NAME --username=$GIT_USERNAME --password $GIT_TOKEN
oc create secret generic $GIT_SECRET_NAME --from-literal=username=$GIT_USERNAME --from-literal=password=$GIT_TOKEN --type=kubernetes.io/basic-auth

# annotate the secret
kubectl annotate secret $GIT_SECRET_NAME tekton.dev/git-0=github.com

# create serviceaccount to run the pipeline and associate the git secret with the serviceaccount
kubectl apply -f - <<EOF
apiVersion: v1
kind: ServiceAccount
metadata:
  name: $PIPELINE_SA
secrets:
- name: $GIT_SECRET_NAME
EOF

# Create the ClusterRole
cat << EOF | kubectl apply -f -
kind: ClusterRole
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: tekton-pipelines-admin
rules:
# Permissions for every EventListener deployment to function
- apiGroups: ["triggers.tekton.dev"]
  resources: ["eventlisteners", "triggerbindings", "triggertemplates"]
  verbs: ["get"]
- apiGroups: [""]
  # secrets are only needed for Github/Gitlab interceptors, serviceaccounts only for per trigger authorization
  resources: ["configmaps", "secrets", "serviceaccounts"]
  verbs: ["get", "list", "watch"]
# Permissions to create resources in associated TriggerTemplates
- apiGroups: ["tekton.dev"]
  resources: ["pipelineruns", "pipelineresources", "taskruns"]
  verbs: ["create"]
EOF

# Create these ClusterRoleBindings
oc create clusterrolebinding mqpipelinetektonpipelinesadminbinding --clusterrole=tekton-pipelines-admin --serviceaccount=$PIPELINE_NS:$PIPELINE_SA
oc -n $MQ-NS create clusterrolebinding mqpipelinetektonpipelinesadminbinding --clusterrole=tekton-pipelines-admin --serviceaccount=$PIPELINE_NS:$PIPELINE_SA
oc -n $PN_NS create clusterrolebinding mqpipelinetektonpipelinesadminbinding --clusterrole=tekton-pipelines-admin --serviceaccount=$PIPELINE_NS:$PIPELINE_SA

oc create clusterrolebinding mqpipelinetektontriggersadminbinding --clusterrole=tekton-triggers-admin --serviceaccount=$PIPELINE_NS:$PIPELINE_SA
oc -n $MQ_NS create clusterrolebinding mqpipelinetektontriggersadminbinding --clusterrole=tekton-triggers-admin --serviceaccount=$PIPELINE_NS:$PIPELINE_SA
oc -n $PN_NS create clusterrolebinding mqpipelinetektontriggersadminbinding --clusterrole=tekton-triggers-admin --serviceaccount=$PIPELINE_NS:$PIPELINE_SA

oc create clusterrolebinding mqpipelinepullerbinding --clusterrole=system:image-puller --serviceaccount=$PIPELINE_NS:$PIPELINE_SA
oc -n $MQ_NS create clusterrolebinding mqpipelinepullerbinding --clusterrole=system:image-puller --serviceaccount=$PIPELINE_NS:$PIPELINE_SA
oc -n $PN_NS create clusterrolebinding mqpipelinepullerbinding --clusterrole=system:image-puller --serviceaccount=$PIPELINE_NS:$PIPELINE_SA

oc create clusterrolebinding mqpipelinebuilderinding --clusterrole=system:image-builder --serviceaccount=$PIPELINE_NS:$PIPELINE_SA
oc -n $MQ_NS create clusterrolebinding mqpipelinebuilderinding --clusterrole=system:image-builder --serviceaccount=$PIPELINE_NS:$PIPELINE_SA
oc -n $PN_NS create clusterrolebinding mqpipelinebuilderinding --clusterrole=system:image-builder --serviceaccount=$PIPELINE_NS:$PIPELINE_SA

oc create clusterrolebinding mqpipelineqmeditbinding --clusterrole=queuemanagers.mq.ibm.com-v1beta1-edit --serviceaccount=$PIPELINE_NS:$PIPELINE_SA
oc -n $MQ_NS create clusterrolebinding mqpipelineqmeditbinding --clusterrole=queuemanagers.mq.ibm.com-v1beta1-edit --serviceaccount=$PIPELINE_NS:$PIPELINE_SA
oc -n $PN_NS create clusterrolebinding mqpipelineqmeditbinding --clusterrole=queuemanagers.mq.ibm.com-v1beta1-edit --serviceaccount=$PIPELINE_NS:$PIPELINE_SA

oc create clusterrolebinding mqpipelineqmviewbinding --clusterrole=queuemanagers.mq.ibm.com-v1beta1-view --serviceaccount=$PIPELINE_NS:$PIPELINE_SA
oc -n $MQ_NS create clusterrolebinding mqpipelineqmviewbinding --clusterrole=queuemanagers.mq.ibm.com-v1beta1-view --serviceaccount=$PIPELINE_NS:$PIPELINE_SA
oc -n $PN_NS create clusterrolebinding mqpipelineqmviewbinding --clusterrole=queuemanagers.mq.ibm.com-v1beta1-view --serviceaccount=$PIPELINE_NS:$PIPELINE_SA

oc create clusterrolebinding mqpipelineviewerbinding --clusterrole=view --serviceaccount=$PIPELINE_NS:$PIPELINE_SA
oc -n $MQ_NS create clusterrolebinding mqpipelineviewerbinding --clusterrole=view --serviceaccount=$PIPELINE_NS:$PIPELINE_SA
oc -n $PN_NS create clusterrolebinding mqpipelineviewerbinding --clusterrole=view --serviceaccount=$PIPELINE_NS:$PIPELINE_SA

# Allow the serviceaccount to get secrets from the mq namespace

oc create clusterrole secretreader --verb=get --resource=secrets 
oc -n $MQ_NS create rolebinding secretreaderbinding --clusterrole=secretreader --serviceaccount=$PIPELINE_NS:$PIPELINE_SA
oc -n $PN_NS create rolebinding secretreaderbinding --clusterrole=secretreader --serviceaccount=$PIPELINE_NS:$PIPELINE_SA

# Allow the serviceaccount to create routes in the mq namespace

oc create clusterrole routecreator --verb=get --verb=list --verb=watch --verb=create --verb=update --verb=patch --verb=delete --resource=routes,routes/custom-host
oc -n $MQ_NS create rolebinding routecreatorbinding --clusterrole=routecreator --serviceaccount=$PIPELINE_NS:$PIPELINE_SA
oc -n $PN_NS create rolebinding routecreatorbinding --clusterrole=routecreator --serviceaccount=$PIPELINE_NS:$PIPELINE_SA

# Add the serviceaccount to privileged SecurityContextConstraint
oc adm policy add-scc-to-user privileged system:serviceaccount:$PIPELINE_NS:$PIPELINE_SA

# Add tekton resources
oc apply -f ./tekton/pipelines/
oc apply -f ./tekton/resources/
oc apply -f ./tekton/tasks/
oc apply -f ./tekton/triggers/

# Create route for webhook
cat << EOF | kubectl apply -f -
apiVersion: route.openshift.io/v1
kind: Route
metadata:
  labels:
    app.kubernetes.io/managed-by: EventListener
    app.kubernetes.io/part-of: Triggers
    eventlistener: el-cicd-mq
  name: el-el-cicd-mq-hook-route
spec:
  port:
    targetPort: http-listener
  tls:
    insecureEdgeTerminationPolicy: Redirect
    termination: edge
  to:
    kind: Service
    name: el-el-cicd-mq
EOF
