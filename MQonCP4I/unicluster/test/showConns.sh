#!/bin/bash

clear
green='\033[0;32m'
lgreen='\033[1;32m'
nc='\033[0m'

export QMpre=mq00
export QMname=mq00a
export APPQ=APPQ
export MQCHLLIB='/home/student/MQonCP4I/unicluster/test'
export MQCHLTAB='/home/student/MQonCP4I/unicluster/test/ccdt5.json'
export MQAPPLNAME='MY.GETTER.APP'
export MQCCDTURL='/home/student/MQonCP4I/unicluster/test/ccdt5.json'
export MQSSLKEYR='/home/student/MQonCP4I/unicluster/test/key'


APPNAME=${2:-amqsghac}
DELAY=${3:-1s}

for (( i=0; i<100000; ++i)); do
  CONNCOUNT=`echo "dis conn(*) where(appltag eq '$MQAPPLNAME')" | runmqsc -c $1 | grep "  CONN" | wc -w`
  BALANCED=`echo "dis apstatus('$MQAPPLNAME')" | runmqsc $1 | grep "  BALANCED"`
  clear
  echo -e "${green}$1${nc} / ${green}$MQAPPLNAME${nc} -- ${lgreen}$CONNCOUNT${nc}"
  echo "dis conn(*) where(appltag eq '$MQAPPLNAME')" | runmqsc $1 | grep "  CONN"
  sleep $DELAY
done




