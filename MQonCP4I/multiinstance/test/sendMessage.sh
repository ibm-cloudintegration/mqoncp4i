#!/bin/bash

export QMname=mq03mi
export QMpre=mq03
export MQCCDTURL='/home/ibmuser/MQonCP4I/multiinstance/test/ccdt.json'
export MQSSLKEYR='/home/ibmuser/MQonCP4I/multiinstance/test/key'

echo "Starting amqsphac" $QMname
/opt/mqm/samp/bin/amqsphac APPQ $QMname

