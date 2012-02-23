#!/bin/bash

checkFlow(){
    grep -q gitflow .git/config
    IS_GIT=$?
    echo IS_GIT is: $IS_GIT
}

doFlow() {
    echo is not gitflow
}

dontFlow() {
    echo is not gitflow
}

if [[ -f .git/config ]];then
    checkFlow
    if [[ $IS_GIT == 0 ]]; then
        doFlow
    else
        dontFlow
    fi
else
    echo is not git dir 
fi
