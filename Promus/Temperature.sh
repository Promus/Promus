#!/bin/sh

#  Temperature.sh
#  Promus
#  Copyright © 2013 by Johannes Frotscher.


# tempus=`ioreg -l | grep "IOHWSensors" | grep "current-value" | head -n 1 | awk -F ",\"current-value" '{print $2}' | awk -F ",\"sensor-flags" '{print $1}' | tr -d "\"=" | awk '{print((($1/65536)-32)*5/9)}'`
# printable=`printf "%.1f\n" "$tempus"`
echo 'Temp:                     ' $printable C