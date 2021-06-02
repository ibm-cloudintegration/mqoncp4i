#!/bin/bash

export MQCCDTURL='/home/student/gettingstarted/test/ccdt.json'
export MQSSLKEYR='/home/student/gettingstarted/test/key'

echo "Starting amqsphac" gsmq
/opt/mqm/samp/bin/amqsphac APPQ gsmq
