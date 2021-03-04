#!/bin/bash

export QMpre=MQ00
export QMname=mq00c
export APPQ=APPQ
export MQCHLLIB='/home/ibmuser/MQonCP4I/unicluster/test'
export MQCHLTAB='/home/ibmuser/MQonCP4I/unicluster/test/ccdt.json'
export MQAPPLNAME='MY.GETTER.APP'
export MQCCDTURL='/home/ibmuser/MQonCP4I/unicluster/test/ccdt.json'
export MQSSLKEYR='/home/ibmuser/MQonCP4I/unicluster/test/key'

echo "Starting amqsghac" $QMname
/opt/mqm/samp/bin/amqsghac $APPQ $QMname
