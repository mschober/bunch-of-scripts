#!/bin/bash

P4CHANGES=~/cj/cj-docs


function parseParameters {
for param in $*;
    do
        if [[ $param == -* ]]; then
            setupParameters
        else
            setupGrepString
        fi
    done;
}

function setupParameters{
    PARAM_LIST="$PARAM_LIST $param"
    echo the param list is: $PARAM_LIST
}

function setupGrepString{
    GREP_STRING="$GREP_STRING $param"
    echo the grep string is: $GREP_STRING
}

parseParameters

ack-grep $PARAM_LIST "$GREP_STRING" $P4CHANGES/p4changes.txt
#ack-grep -il stuff ~/cj/cj-docs/p4changes.txt 
