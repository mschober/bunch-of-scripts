#!/usr/bin/perl -w
use strict;

my @upper_words = qw/
	alter
	case
	create
	drop
	exists
	index
	initial
	loggging
	nologging
	on
	parallel
	return
    %notfound
    all
    and
    as
    asc
    begin
    between
    commit
    cursor
    date
    declare
    desc
    distinct
    else
    elsif
    end
    fetch
    from
    function
    if
    if
    in
    insert
    into
    into
    is
    loop
    next
    noparallel
    not
    null
    number
    number
    or
    out
    package
    pctincrease
    procedure
    rollback
    select
    set
    storage
    sysdate
    table
    tablespace
    then
    timestamp
    union
    update
    values
    varchar2
    varchar2
    where
/;

push(@upper_words,
    'execute immediate',
    'create table',
    'end if',
    'delete from',
    'exit when',
    'group by',
    'order by',
    'exception when',
    'case when',
    'sql%rowcount',
    'create or replace',
    'package body',
);

while (<STDIN>) {
    $_ =~ s/\t/    /;
    foreach my $word (@upper_words) {
        $_ =~ s/\b$word\b/\U$word/i;
    }
    print($_);
}
