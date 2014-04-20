#!/bin/sh

#  RAM.sh
#  Promus
#
#  Created by John on 06/05/2013.
#  Copyright (c) 2013 USE-Software. All rights reserved.

ps aux | awk '{print $6}' | awk 'FNR>1' | awk '{ print $1 / (1024)}'
