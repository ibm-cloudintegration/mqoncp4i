#!/bin/bash

export QMname=mq00mi
export QMpre=mq00
export MQCCDTURL='/home/student/MQonCP4I/multiinstance/test/ccdt.json'
export MQSSLKEYR='/home/student/MQonCP4I/multiinstance/test/key'

echo "Starting amqsghac" $QMname
/opt/mqm/samp/bin/amqsghac APPQ $QMname
