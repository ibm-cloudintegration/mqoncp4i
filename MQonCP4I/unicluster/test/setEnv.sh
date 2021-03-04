#!/bin/bash

export QMpre=MQ00
export QMname=mq00a
export APPQ=APPQ
export MQCHLLIB='/home/ibmuser/MQonCP4I/unicluster/test'
export MQCHLTAB='/home/ibmuser/MQonCP4I/unicluster/test/ccdt.json'
export MQAPPLNAME='MY.GETTER.APP'
export MQCCDTURL='/home/ibmuser/MQonCP4I/unicluster/test/ccdt.json'
export MQSSLKEYR='/home/ibmuser/MQonCP4I/unicluster/test/key'
export MQSERVER='MQ00CHLA/TCP/mq00a-ibm-mq-qm-mq.dteroks-1000006dxs-z08br-8946bbc006b7c6eb0829d088919818bb-0000.us-east.containers.appdomain.cloud(443)'

echo "Starting runmqsc" $QMname
/opt/mqm/bin/runmqsc $QMname
