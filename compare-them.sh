#!/bin/bash

OUTFILE=result.comm
FUNC=sort

usage()
{
cat << EOF
usage: $0 options file1 file2

This script compares to files wrapping the linux 'comm' function.

OPTIONS:
   -h      Show this message.
   -o      Specify a new output file. Defaults to $OUTFILE.
   -f      Specify a different function, note sort is expected. Defaults to $FUNC.

EOF
}

while getopts "ho:f:" flag; do
case "$flag" in
    h) usage && exit1;;
    o) OUTFILE=$OPTARG;;
    f) FUNC=$OPTARG;;
esac
done


[[ $# -lt 2 ]] && usage && exit 1
FILE1=${@:$OPTIND:1}
FILE2=${@:$OPTIND+1:1}

comm <($FUNC $FILE1) <($FUNC $FILE2) | tee $OUTFILEFILE
