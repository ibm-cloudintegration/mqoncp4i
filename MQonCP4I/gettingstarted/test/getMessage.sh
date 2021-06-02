#!/bin/bash

export MQCCDTURL='/home/student/MQonCP4I/gettingstarted/test/ccdt.json'
export MQSSLKEYR='/home/student/gettingstarted/test/key'

echo "Starting amqsghac" gsmq
/opt/mqm/samp/bin/amqsghac APPQ gsmq
