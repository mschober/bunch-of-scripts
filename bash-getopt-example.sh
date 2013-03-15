#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail
 
source $HOME/.bash_getopt
 
foo_dflt="wibble"
 
bash-getopt "$@" <<END_OPTS
 
    FOO=f|foo:NAME "$foo_dflt" "this is a description for the option. it can span
        multiple lines. foo has a single : so it requires a value when used."
 
    BAR=b|bar::PATH  "" "bar has :: after it, so passing a value is optional"
 
    ZIP=z|zip "zip has no :, so it is a boolean flag. flag options only need
        a description; the default is *always* the empty string"
 
END_OPTS
 
# option values are in the specified vars
echo "[$FOO] [$BAR] [$ZIP]"
 
# leftover/positional args are in an ARGV array
for a in "${ARGV[@]}"; do echo "[$a]"; done
 
# a function is created to display usage info:
_usage
