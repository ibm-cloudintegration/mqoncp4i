#!/bin/bash

export QMpre=mq00
export QMname=mq00a
export APPQ=APPQ
export MQCHLLIB='/home/student/MQonCP4I/unicluster/test'
export MQCHLTAB='/home/student/MQonCP4I/unicluster/test/ccdt.json'
export MQAPPLNAME='MY.PUTTER.APP'
export MQCCDTURL='/home/student/MQonCP4I/unicluster/test/ccdt.json'
export MQSSLKEYR='/home/student/MQonCP4I/unicluster/test/key'

echo "Starting amqsphac" $QMname
/opt/mqm/samp/bin/amqsphac $APPQ $QMname
