#!/bin/sh

#  RamLevel.sh
#  PromusActivityMonitor
#
#  Created by John on 10/05/2013.
#  Copyright (c) 2013 USE-Software. All rights reserved.

# this is volatiley working in %
# ps -ev | awk '{print $12}' | awk 'FNR>1' | awk '{total += $1}END{ print total}'

top -l1 | grep 'M used' | awk -F "inactive, " '{print $2}' | awk -F "," '{print $1}' | awk -F "M used" '{print $1}'