#!/bin/bash
export MQCCDTURL='/home/student/gettingstarted/test/ccdt.json'
export MQSSLKEYR='/home/student/gettingstarted/test/key'

for (( i=0; i<$1; ++i)); do
  echo "Starting amqsphac" gsmq
  /opt/mqm/samp/bin/amqsphac APPQ gsmq &
done
