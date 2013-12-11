#!/bin/sh

#  UsedSpace.sh
#  Promus
#  Copyright � 2013 by Johannes Frotscher.

echo "Used Space:                 "; echo `df -k / | tail -1` | cut -d " " -f 5