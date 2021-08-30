#! /bin/bash

PIPELINE_NS=<insert your namespace here>
PIPELINE_SA=pipeline

MQ_NS=<insert your namespace here>
PN_NS=cp4i

GIT_SECRET_NAME=user-at-github

# Insert your Git Access Token below
GIT_TOKEN=<paste git token here and remove brackets>

# Insert your Git UserName here
GIT_USERNAME=<paste github username here and remove brackets>

# Create the pipeline namespace
kubectl create ns $PIPELINE_NS

# Change to the new namespace
oc project $PIPELINE_NS

# create the git secret
# oc secret new-basicauth $GIT_SECRET_NAME --username=$GIT_USERNAME --password $GIT_TOKEN
oc create secret generic $GIT_SECRET_NAME --from-literal=username=$GIT_USERNAME --from-literal=password=$GIT_TOKEN --type=kubernetes.io/basic-auth

# annotate the secret
kubectl annotate secret $GIT_SECRET_NAME tekton.dev/git-0=github.com

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
