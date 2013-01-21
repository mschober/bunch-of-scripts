#!/usr/bin/env perl
#perl -ne 'print if /START/../END/'
use strict;
use warnings;

while (<>) {
  if (/^MERGE$/../^batch_merged /) {
    print;
  }
}
