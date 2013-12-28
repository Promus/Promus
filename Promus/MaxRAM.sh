#!/bin/sh

#  MaxRAM.sh
#  PromusActivityMonitor
#
#  Created by John on 11/05/2013.
#  Copyright (c) 2013 USE-Software. All rights reserved.

echo `top -l1 | grep 'M used' | awk -F "inactive, " '{print $2}' | awk -F "," '{print $1}' | awk -F "M used" '{print $1}'` + `top -l1 | grep 'M used' | awk -F "inactive, " '{print $2}' | awk -F ", " '{print $2}' | awk -F "M free" '{print $1}'` | bc