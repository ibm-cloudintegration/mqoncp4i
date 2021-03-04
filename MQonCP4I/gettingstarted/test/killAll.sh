#!/bin/bash

APPNAME=${1:-amqsphac}

kill $(ps -e | grep $APPNAME | awk '{print $1}')
kill $(ps -e | grep amqsghac | awk '{print $1}')

