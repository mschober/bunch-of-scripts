#!/bin/bash

FILE=$1

echo "deleting the first line from $FILE"
sed -i -e '1d' $FILE
