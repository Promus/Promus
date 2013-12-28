#!/bin/sh

#  CPU.sh
#  Promus
#
#  Created by John on 06/05/2013.
#  Copyright (c) 2013 USE-Software. All rights reserved.

ps -axceo pcpu | awk 'FNR>1'