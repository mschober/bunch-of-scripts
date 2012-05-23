my $master_process = 'FDM_DAILY_LOAD';
my @expected_entries = (
    'C_TRANSACTIONS_AUDIT',
    'C_COMMISSIONS_AUDIT',
    'C_COMMISSIONS_LOAD - MV MONTHLY',
    'C_COMMISSIONS_LOAD',
    'C_VALID_IMPS_LOAD',
    'C_VALID_CLICKS_LOAD',
    'C_FINANCIAL_TRANSACTIONS_LOAD - MV MONTHLY',
    'C_FINANCIAL_TRANSACTIONS_LOAD',
    'BRIDGE_PUBLISHER_GROUP_LOAD',
    'DIM_PUBLISHER_GROUP_LOAD',
    'DW_DIMENSION_LOADING',
    'FDM_DAILY_LOAD',
);


sub is_completed {
    my ($process_name) = @_;
    my $is_completed_sql = qq|
        SELECT *
        FROM dw_log_process
        WHERE process_name = :master_process
        ORDER BY process_id DESC
    |;
}

my $placeholders = join(", ", map { "?" } @expected_entries);

my $progress_sql = qq|
    SELECT *
    FROM dw_log_process
    WHERE process_name IN (
    ) AND end_time IS NOT NULL
    ORDER BY process_id DESC
|
