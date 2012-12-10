#!/bin/bash

cd /home/appworx/out
QUICK_FILTER=500
echo "quick listing `pwd` to $QUCK_FILTER"

ls -lt | head -$QUICK_FILTER | grep "`month-day.sh`" | awk '{ print $9 }' | xargs -I file readlink -f file
