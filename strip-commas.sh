#!/bin/bash

FILE=$1


echo "removing quotes from $FILE"
sed -i -e 's/"//g' $FILE

