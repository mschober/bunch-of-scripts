package Database;
use strict;
use warnings;

use Exporter::Easy (
    OK => [qw/
        fetch_result
        fetch_result_rows
        fetch_results
        get_dbh
        get_new_dbh
    /],
);

use Carp   qw/ confess             /;
use DBInfo qw/ get_default_db_info /;

our %db_cache;

sub fetch_results {
    my ($dbh, $sql, @bind_params) = @_;

    return $dbh->selectall_arrayref($sql, { RaiseError => 1 }, @bind_params);
}

sub fetch_result_rows {
    my ($dbh, $sql, @bind_params) = @_;
    return $dbh->selectall_arrayref($sql, { RaiseError => 1, Slice => {}, }, @bind_params);
}

sub fetch_result {
    my ($dbh, $sql, @bind_params) = @_;
    my $results = fetch_results($dbh, $sql, @bind_params);

    if (my $num_results = scalar @$results) {
        confess("Expected 1 result, got $num_results");
    }

    return $results->[0];
}

sub get_dbh {
    my $db_info = shift;

    $db_info                     ||= get_default_db_info();
    $db_cache{$db_info->{alias}} ||= get_new_dbh($db_info);

    return $db_cache{$db_info->{alias}};
}

sub get_new_dbh {
    my $db_info  = shift;
    my $conn_str = "dbi:Oracle:$db_info->{service_name}";
    return DBI->connect($conn_str, $db_info->{dbuser}, $db_info->{passwd}, { RaiseError => 1 });
}

sub run_sqlplus {
    my ($db_info, $sql) = @_;
    my $sqlplus_str = "sqlplus $db_info->{dbuser}/$db_info->{passwd}\@$db_info->{service_name}";

    open FH, "| $sqlplus_str";
    print FH $sql;
}

1;
