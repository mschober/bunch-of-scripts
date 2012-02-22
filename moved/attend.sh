#!/bin/bash

if [[ -z $* ]] ;then
    screen -r
fi
screen -x mschober/$1
