#!/bin/sh

#  Date.sh
#  Promus
#  Copyright © 2014 by Johannes Frotscher.

aufzeit=`uptime | cut -c8-23`
echo 'Uptime:     ' $aufzeit