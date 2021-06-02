#!/bin/bash

export QMpre=mq00
export QMname=mq00a

export MQCHLLIB='/home/student/MQonCP4I/unicluster/test'
export MQCHLTAB='/home/student/MQonCP4I/unicluster/test/ccdt5.json'
export MQAPPLNAME='MY.GETTER.APP'
export MQCCDTURL='/home/student/MQonCP4I/unicluster/test/ccdt5.json'
export MQSSLKEYR='/home/student/MQonCP4I/unicluster/test/key'
export CCDT_NAME='*ANY_QM'

CCDT_NAME=${2:-"*ANY_QM"}

for (( i=1; i<=1; ++i)); do
  echo "Starting amqsghac" $CCDT_NAME
  /opt/mqm/samp/bin/amqsghac APPQ $CCDT_NAME 
done
