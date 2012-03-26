#!/bin/bash

grep -q gitflow .git/config
if [[ $? -ne 0 ]]; then
    echo is not gitflow 
else
    echo is gitflow 
fi

#adding a temp comment
