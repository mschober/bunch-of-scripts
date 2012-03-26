#!/usr/bin/perl -w
use strict;

my @upper_words = qw/
    select
    into
    from
    where
    and
    or
    if
    then
    insert
    into
    values
    null
    commit
    rollback
    number
    varchar2
    noparallel
    not
    in
    out
    as
    fetch
    cursor
    %notfound
    loop
    begin
    end
    else
    elsif
    sysdate
    date
    timestamp
    number
    varchar2
    declare
    if
    distinct
    between
    update
    set
    asc
    desc
    package
    procedure
    function
    is
	return
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