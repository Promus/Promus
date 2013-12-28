#!/bin/sh

#  Processes.sh
#  PromusActivityMonitor
#
#  Created by John on 06/05/2013.
#  Copyright (c) 2013 USE-Software. All rights reserved.

ps axco command | awk 'FNR>1'