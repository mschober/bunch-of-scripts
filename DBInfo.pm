package DBInfo;
use strict;
use warnings;

use Exporter::Easy (
    OK => [qw/
        get_default_db_info
        get_db_info
    /],
);

our $db_infos = {
    #pcjodw => {
    #    alias        => 'pcjopr',
    #    sid          => 'cjodw',
    #    service_name => 'pcjodw',
    #    dbuser       => 'mschober',
    #    passwd       => '',
    #    host         => 'pcjodw.db.cj.com',
    #    port         => '1531',
    #},
    devdb    => {
        alias        => 'devdb',
        sid          => 'devdb',
        service_name => 'devdb',
        dbuser       => 'mschober',
        passwd       => 'test',
        host         => 'devdb.db.cj.com',
        port         => '1541',
    },
    tcjoweb5 => {
        alias        => 'tcjoweb5',
        sid          => 'tcjoweb5',
        service_name => 'tcjoweb5',
        dbuser       => 'cj',
        passwd       => 'qa%555',
        host         => 'tcjotrf5.db.cj.com',
        port         => '1521',
    },
    tcjotrf5 => {
        alias        => 'tcjotrf5',
        sid          => 'tcjotrf5',
        service_name => 'tcjotrf5',
        dbuser       => 'cjotrf',
        passwd       => 'qa%555',
        host         => 'tcjotrf5.db.cj.com',
        port         => '1531',
    },
    tcjodw5  => {
        alias        => 'tcjodw5',
        sid          => 'tcjodw5',
        service_name => 'tcjodw5',
        dbuser       => 'cjodw',
        passwd       => 'qa#555',
        host         => 'tcjodw5.db.cj.com',
        port         => '1521',
    },
    tcjopr5  => {
        alias        => 'tcjopr5',
        sid          => 'tcjopr5',
        service_name => 'tcjodw5',
        dbuser       => 'cjopr',
        passwd       => 'qa%555',
        host         => 'tcjodw5.db.cj.com',
        port         => '1521',
    },
};

sub get_default_db_info {
    return $db_infos->{devdb};
}

sub get_db_info {
    my $name = shift;
    return $db_infos->{$name};
}

1;
