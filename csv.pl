#!/usr/bin/perl -w
use strict;

use File::Basename qw/ basename /;

my @lines;
while (<STDIN>) {
    my $line = $_;

    $line =~ s/\.groovy//;
    $line =~ s/\.java//;
    $line =~ s/\n//;

    push(@lines, basename($line));
}

print join(",", @lines) . "\n";
