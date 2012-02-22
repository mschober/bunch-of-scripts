#!/bin/bash


CONFIG_FILE=$1
if [[ -z $1 ]];then
    CONFIG_FILE='cognos_101.rdp'
fi

tsclient -x ~/.tsclient/$CONFIG_FILE
