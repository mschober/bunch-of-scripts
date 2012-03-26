#!/bin/bash

RESIN_HOME=/usr/local/resin
SERVER_ROOT=/usr/local/web

export RESIN_HOME
export SERVER_ROOT

$RESIN_HOME/bin/httpd.sh -server-root $SERVER_ROOT \
                         -conf $SERVER_ROOT/conf/resin.conf \
                         -server a -pid $SERVER_ROOT/a.pid \
                         $*
