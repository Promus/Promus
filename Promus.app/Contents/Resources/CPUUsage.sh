#!/bin/sh

#  CPUIdle.sh
#  Promus
#  Copyright � 2013 by Johannes Frotscher.

cpuusage=`top -l1 | grep 'CPU usage' | awk -F " idle" '{print $1}' | awk '{print $7}'`
echo 'CPU Idle:                 ' $cpuusage