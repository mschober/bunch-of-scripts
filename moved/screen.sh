#!/bin/bash


user=`whoami`
if [[ "$1" == "start" ]];then
    screen-original -S $2 -c /home/mschober/.screenrc-$user
elif [[ "$1" == "join" ]];then
    screen-original -x $user/$2
elif [[ "$1" == "ls" ]];then
    screen-original -ls 
elif [[ -z "$1" ]];then
    screen-original -r 
else
    screen-original $@
fi

