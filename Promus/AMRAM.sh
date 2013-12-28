#!/bin/sh

#  RAM.sh
#  Promus
#
#  Created by John on 06/05/2013.
#  Copyright (c) 2013 USE-Software. All rights reserved.

ps -axceo rss | awk 'FNR>1' | awk '{ print $1 / (1024)}' | awk 'BEGIN{RS="\n"}; {printf "%0.1f", $1}; { print NF }'