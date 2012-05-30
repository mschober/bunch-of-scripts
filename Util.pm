package Util;
use strict;
use warnings;

use Exporter::Easy (
    OK => [qw/
        write_csv_hashes
    /],
);

use IO::File;
use Text::CSV;

sub new_write_fh {
    my $filename = shift;
    my $fh = IO::File->new($filename, "w")
        or die "Unable to open file $filename: $!";
    $fh->binmode(":utf8");

    return $fh;
}

sub new_read_fh {
    my $filename = shift;
    my $fh = IO::File->new($filename, "r")
        or die "Unable to open file $filename: $!";
    $fh->binmode(":utf8");

    return $fh;
}

sub write_csv_hashes {
    my ($filename, $rows, $column_order) = @_;
    return unless @$rows;

    my $fh  = new_write_fh($filename);
    my $csv = Text::CSV->new ( { binary => 1, eol => "\n" } )  # should set binary attribute.
        or die "Cannot use CSV: " . Text::CSV->error_diag ();

    $column_order ||= [ sort keys %{ $rows->[0] } ];
    $csv->print($fh, $column_order);
    foreach my $row (@$rows) {
        $csv->print($fh, [ map { $row->{$_} } @$column_order ]);
    }

    $fh->close();
}


1;
