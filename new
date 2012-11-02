#!/bin/bash

NOW=`now`
MINUTE=`minute`
SECOND=`second`

if [ -d $NOW ]; then
    [ -d $NOW.$MINUTE ] && mkdir $NOW.$MINUTE.$SECOND || mkdir $NOW.$MINUTE
else
    mkdir $NOW
fi

