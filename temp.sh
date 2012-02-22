#!/bin/bash

isGit() {
    if [[ -f .git/config ]]; then
        IS_GIT=true
    else
        IS_GIT=false
    fi
}

isGit 
echo IS_GIT is: $IS_GIT
if [[ $IS_GIT ]]; then
    grep -q gitflow .git/config
else
    echo is not git
fi

if [[ $? -ne 0 ]]; then
    echo is not gitflow 
else
    echo is gitflow 
fi
