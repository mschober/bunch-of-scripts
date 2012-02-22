#!/bin/bash

label=$1
if [[ -z $* ]];then
    $label="abc"
fi

name="-S $label"
config="-c /home/mschober/.screenrc-share"
param="$name $config"

screen $param
