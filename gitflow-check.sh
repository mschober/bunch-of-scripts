#!/bin/bash

gitCheck() {
    if [[ -f .git/config ]]; then
        IS_GIT=true
    else
        IS_GIT=false
    fi
}

gitCheck 
if [[ $IS_GIT == true ]]; then
    grep -q gitflow .git/config
else
    echo change to a git directory
    exit
fi

if [[ $? -ne 0 ]]; then
    echo is not gitflow 
else
    echo is gitflow 
fi
