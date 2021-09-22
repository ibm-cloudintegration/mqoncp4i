#!/bin/bash

export QMpre=mq00
export QMname=mq00strm
export APPQ=APPQ
export STREAMQ=MY.LOG.QUEUE
export MQCHLLIB='/home/student/MQonCP4I/streamq/test'
export MQCHLTAB='/home/student/MQonCP4I/streamq/test/ccdt.json'
export MQAPPLNAME='MY.PUTTER.APP'
export MQCCDTURL='/home/student/MQonCP4I/streamq/test/ccdt.json'
export MQSSLKEYR='/home/student/MQonCP4I/streamq/test/key'

echo "Starting amqsghac" $QMname
/opt/mqm/samp/bin/amqsghac $APPQ $QMname
