#!/usr/bin/perl -w
use strict;

use Getopt::Long;
use DBI;
use File::Slurp;
use File::Spec;
use Try::Tiny;
use DateTime;

use File::Basename qw/ basename                  /;
use Util           qw/ write_csv_hashes          /;
use Database       qw/ get_dbh fetch_result_rows /;
use DBInfo         qw/ get_db_info               /;


GetOptions (
    'p|publisher' => \my $publisher,
    'd|devdb'     => \my $devdb,
    'o|output=s'  => \my $output,
);

sub usage {
    return <<HERE;
    Usage: demo.pl -o some_directory [--publisher] [--devdb] list of files
HERE
}

sub main {
    my $db_info = get_db_info($devdb ? "devdb" : "tcjopr5");
    my $dbh     = get_dbh($db_info);
    local $|=1; # turn on autoflush

    for my $filename (@ARGV) {
        my $seconds = display_start($filename);

        try {
            my $output_filename = get_output_filename($filename);
            my $sql             = read_file($filename);
            $sql                = format_sql($sql);

            my $results = fetch_result_rows($dbh, $sql);
            write_csv_hashes($output_filename, $results);

            $seconds = time() - $seconds;
            print "complete. [$seconds seconds]\n";
        } catch {
            $seconds = time() - $seconds;
            print "failed. [$seconds seconds]\n";
            print "$! \n";
        }
    }
}

sub display_start{
    my $filename = shift;
    my $seconds = time();

    print "$filename starting...";
    return $seconds;
}

sub get_output_filename {
    my $filename = shift;
    $filename= basename($filename);
    $filename =~ s/\.sql/.csv/;

    return File::Spec->catfile($output, $filename);
}

sub format_sql {
    my $sql = shift;
    my %defaults = (
        ':advCid'     => 2626374,
        ':pubCid'     => 46157,
        ':startDate'  => "to_date('2012-03-01', 'YYYY-MM-DD')",
        ':endDate'    => "to_date('2012-03-05', 'YYYY-MM-DD')",
        ':startRow'   => 1,
        ':endRow'     => 1000000,
        '{filterBy}'  => '',
        '{joinTables}'=> '',
        '{orderBy}'   => 'order by 1',
    );

    $defaults{":Cid"} = $publisher
        ? $defaults{":pubCid"}
        : $defaults{":advCid"}
    ;

    $defaults{":cid"}       = $defaults{":Cid"};
    $defaults{":startdate"} = $defaults{":startDate"};
    $defaults{":enddate"}   = $defaults{":endDate"};

    for my $param (keys %defaults) {
        $sql =~ s/$param/$defaults{$param}/mg;
    }

    $sql =~ s/\t/    /mg;
    $sql =~ s/^\s+\n//mg;

    return $sql;
}

main();
