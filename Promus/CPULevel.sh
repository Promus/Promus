#!/bin/sh

#  CPULevel.sh
#  PromusActivityMonitor
#
#  Created by John on 10/05/2013.
#  Copyright (c) 2013 USE-Software. All rights reserved.

# ps -ev | awk '{print $11}' | awk 'FNR>1' | awk '{total += $1}END{ print total}'

top -l1 | grep 'CPU usage' | awk -F " idle" '{print $1}' | awk '{print $7}' | awk -F "%" '{ print $1}' | awk '{ print $1 - (100) }' | awk '{ print $1 * (-1) }'