#!/bin/sh

#  IPAddress.sh
#  Promus
#  Copyright � 2013 by Johannes Frotscher.

IPAddress=`ifconfig | grep 'inet ' | grep -vn 127.0.0.1 | cut -c9-21 | head -1`
if [ $IPAddress != 0 ] 2>/dev/null;
then
echo 'IP:               ' $IPAddress
else
echo 'IP:                 Offline'
fi
