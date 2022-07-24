/*check all tables from the database*/
select * from pg_Tables;


/*check encoded column from SVV_TABLE_INFO to see the encoding type*/
select * from svv_table_info 
where "table" = 'tbl_books'
and schema= 'laptop7_library';

select * from svv_table_info 
where "table" = 'my_Table'
and schema= 'my_schema';



SELECT
    schemaname,
    tablename,
    pg_table_def.column,
    encoding,
    type,
    sortkey
FROM
    pg_table_def
WHERE
    tablename = 'tbl_books'
    --this will vary based on the table you are running it for
AND sortkey = 1;

