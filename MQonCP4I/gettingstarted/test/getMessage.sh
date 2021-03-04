#!/bin/bash

export MQCCDTURL='/home/callum/2020.2/MQonCP4I/resources/cp4i2020.2/gettingstarted/test/ccdt.json'
export MQSSLKEYR='/home/callum/2020.2/MQonCP4I/resources/cp4i2020.2/gettingstarted/test/key'

echo "Starting amqsghac" gsmq
/opt/mqm/samp/bin/amqsghac APPQ gsmq

