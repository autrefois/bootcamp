SELECT
    *
FROM
    pg_table_def
WHERE
    /*tablename like '%_books'
    and*/ tablename like'%dim_books%' ;
SELECT
    book_sk,
    book_id,
    author,
    title,
    genre_id,
    amount,
    first_date,
    end_date
FROM
    liviu_library.tb_dim_books;

CREATE TABLE IF NOT EXISTS
    test_rs_00.tbl_sort_csk
    (
        LIKE liviu_library.tb_dim_books including defaults
    ) ;

SELECT
    *
FROM
    test_rs_00.tbl_sort_csk ;

ALTER TABLE
    test_rs_00.tbl_sort_csk ALTER COMPOUND SORTKEY(book_id, book_sk) ;
    

ALTER TABLE
    test_rs_00.tbl_sort_csk ALTER COMPOUND SORTKEY(book_id, book_sk,genre_id ) ;
commit;
select * 
from pg_table_Def
where tablename = 'tbl_sort_csk';

insert into test_rs_00.tbl_sort_csk
(book_sk,
book_id,
author,
title,
genre_id,
amount,
first_date,
end_date)
select 
book_sk,
book_id,
author,
title,
genre_id,
amount,
first_date,
end_date
from liviu_library.tb_dim_books;
--create table
drop table if exists test_rs_00.tbl_sort_isk;
CREATE TABLE
    test_rs_00.tbl_sort_isk
    (
        LIKE liviu_library.tb_dim_books including defaults
    ) ;

ALTER TABLE
    test_rs_00.tbl_sort_isk ALTER SORTKEY(book_id, book_sk) ;
commit;
select * 
from pg_table_Def
where tablename = 'tbl_sort_isk';


insert into test_rs_00.tbl_sort_isk
(book_sk,
book_id,
author,
title,
genre_id,
amount,
first_date,
end_date)
select 
book_sk,
book_id,
author,
title,
genre_id,
amount,
first_date,
end_date
from liviu_library.tb_dim_books;
explain
SELECT
    *
FROM
    test_rs_00.tbl_sort_isk i
WHERE
    i.book_id >= 100
AND i.book_id < 300;

analyze test_rs_00.tbl_sort_isk ;
analyze test_rs_00.tbl_sort_csk ;
