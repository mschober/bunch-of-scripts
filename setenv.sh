#!/bin/bash

VIRTUAL_ENV=$1
VIRTUAL_ENV=`echo ${VIRTUAL_ENV%/}`
BIN=$VIRTUAL_ENV/bin

[ -d $BIN ] && PATH=$BIN:$PATH || echo $BIN is not a directory
