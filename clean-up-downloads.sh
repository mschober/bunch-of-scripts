#!/bin/bash

TODAY=$(date "+%F")
HDR=$HOME/.headers/backup.hdr
BCK_HOME_DIR=/Volumes/grumpy/$(hostname)/home/$(whoami)
SRC=$HOME/Downloads
TGT=$BCK_HOME_DIR/Downloads
LOGFILE=$BCK_HOME_DIR/logs/~.Downloads.$TODAY.log

function _LOG(){
  export LOGFILE=$LOGFILE
  echo "[ $(date "+%F %T") ]  $1" | tee -a $LOGFILE #> >(tee -a $LOGFILE) 2> >(tee -a ${LOGFILE}.err >&2)
}

export -f _LOG

function greet(){
  cat $HDR | tee -a $LOGFILE
}

function create_dir(){
  if [[ ! -d $1 ]]; then
    _LOG "Creating $1"
    mkdir -p $1
  fi
}


function cleanup(){
  create_dir "$TGT"

  _LOG "Moving $SRC/* to $TGT"
  find $SRC | grep -v "^$SRC$"  | xargs -I '{}' bash -c '_LOG "mv $@" ; $(mv "{}" '"$TGT"' 2> >(tee -a ${LOGFILE}.err >&2))' _ "'{}' '$TGT'"
}

greet
cleanup

