#!/usr/bin/perl -w
use strict;

use Getopt::Long;

GetOptions (
    'a|all'  => \my $all,
);

my %state = (
    "cape_tac_aggr_day"     => "Not Started",
    "cape_tag_aggr_day"     => "Not Started",
    "cape_tal_aggr_day"     => "Not Started",
    "cape_tapcg_aggr_day"   => "Not Started",
    "cape_tapcw_aggr_day"   => "Not Started",
    "cape_tapc_aggr_day"    => "Not Started",
    "cape_tapg_aggr_day"    => "Not Started",
    "cape_tapl_aggr_day"    => "Not Started",
    "cape_tapwl_aggr_day"   => "Not Started",
    "cape_tapw_aggr_day"    => "Not Started",
    "cape_tap_aggr_day"     => "Not Started",
    "cape_ta_aggr_day"      => "Not Started",
    "cape_tp_aggr_day"      => "Not Started",
    "cape_tpw_aggr_day"     => "Not Started",
                             
    "cape_tac_aggr_month"   => "Not Started",
    "cape_tag_aggr_month"   => "Not Started",
    "cape_tal_aggr_month"   => "Not Started",
    "cape_tapcg_aggr_month" => "Not Started",
    "cape_tapcw_aggr_month" => "Not Started",
    "cape_tapc_aggr_month"  => "Not Started",
    "cape_tapg_aggr_month"  => "Not Started",
    "cape_tapl_aggr_month"  => "Not Started",
    "cape_tapwl_aggr_month" => "Not Started",
    "cape_tapw_aggr_month"  => "Not Started",
    "cape_tap_aggr_month"   => "Not Started",
    "cape_ta_aggr_month"    => "Not Started",
    "cape_tp_aggr_month"    => "Not Started",
    "cape_tpw_aggr_month"   => "Not Started",
);

while (<STDIN>) {
    my $line = $_;
    if ($line =~ /Done Staging for table (.*)/) {
        $state{$1} = "Started";
    } elsif ($line =~ /Done Merging for table (.*)/) {
        $state{$1} = "Done";
    }
}

my $interesting = 0;
for my $key (sort keys %state) {
    my $value = $state{$key};
    next unless $all || $value ne 'Done';
    $interesting += 1;
    print "    $key : $value\n";
}

print "Interesting Tables: $interesting\n";

