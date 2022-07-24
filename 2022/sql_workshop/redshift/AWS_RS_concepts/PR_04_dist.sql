CREATE TABLE
    test_rs_00.test_dist_all
    (
        _key INT,
        _value VARCHAR(2)
    )
    diststyle ALL;

CREATE TABLE
    test_rs_00.test_dist_even
    (
        _key INT,
        _value VARCHAR(2)
    )
    diststyle even;

CREATE TABLE
    test_rs_00.test_dist_key_num
    (
        _key NUMERIC,
        _value VARCHAR(2)
    )
    diststyle KEY distkey
    (
        _key
    ) ;

CREATE TABLE
    test_rs_00.test_dist_key_int
    (
        _key INT,
        _value VARCHAR(2)
    )
    diststyle KEY distkey
    (
        _key
    ) ;

CREATE TABLE
    test_rs_00.test_dist_key_bigint
    (
        _key bigint,
        _value VARCHAR(2)
    )
    diststyle KEY distkey
    (
        _key
    ) ;

CREATE TABLE
    test_rs_00.test_dist_key_bigint_sortkey
    (
        _key bigint,
        _value VARCHAR(2)
    )
    diststyle KEY distkey
    (
        _key
    )
    sortkey
    (
        _key
    ) ;

CREATE TABLE
    test_rs_00.test_dist_key_int_sortkey
    (
        _key INT,
        _value VARCHAR(2)
    )
    diststyle KEY distkey
    (
        _key
    )
    sortkey
    (
        _key
    ) ;

analyze test_rs_00.test_dist_even;
analyze test_rs_00.test_dist_key_num;
analyze test_rs_00.test_dist_key_int;
analyze test_rs_00.test_dist_key_bigint;

analyze test_rs_00.test_dist_key_int_sortkey;
analyze test_rs_00.test_dist_key_bigint_sortkey;


explain
SELECT
    t1._key,
    t2._key
FROM
    test_dist_even t1
JOIN
    test_dist_key_int t2
 ON
    (
        t1._value = t2._value) ;

/* XN Hash Join DS_DIST_BOTH  (cost=15.00..19201542.00 rows=7200 width=8) */

explain
SELECT
    t1._key,
    t2._key
FROM
    test_dist_even t1
JOIN
    test_dist_key_int t2
 ON
    (
        t1._key = t2._key) ;

explain
SELECT
    t1._key,
    t2._key
FROM
    test_dist_all t1
JOIN
    test_dist_even t2
 ON
    (
        t1._key = t2._key) ;

/* XN Hash Join DS_DIST_ALL_NONE  (cost=15.00..1542.00 rows=7200 width=8) */

explain
SELECT
    t1._key,
    t2._key
FROM
    test_dist_all t1
JOIN
    test_dist_key_num t2
 ON
    (
        t1._key = t2._key) ;

/* XN Hash Join DS_DIST_ALL_NONE  (cost=15.00..2487.50 rows=6000 width=21) */

explain
SELECT
    t1._key,
    t2._key
FROM
    test_dist_all t1
JOIN
    test_dist_key_int t2
 ON
    (
        t1._key = t2._key) ;

/* XN Hash Join DS_DIST_ALL_NONE  (cost=15.00..1542.00 rows=7200 width=8) */

explain
SELECT
    t1._key,
    t2._key
FROM
    test_dist_even t1
JOIN
    test_dist_key_int t2
 ON
    (
        t1._key = t2._key) ;

/* XN Hash Join DS_DIST_OUTER  (cost=15.00..4801542.00 rows=7200 width=8) */

explain
SELECT
    t1._key
FROM
    test_dist_even t1;

/* XN Seq Scan on test_dist_even t1  (cost=0.00..12.00 rows=1200 width=4) */

explain
SELECT
    t1._key,
    t2._key
FROM
    test_dist_key_num t1
JOIN
    test_dist_key_int t2
 ON
    (
        t1._key = t2._key) ;

/*  XN Hash Join DS_BCAST_INNER  (cost=15.00..144002487.50 rows=6000 width=21)  */

/* Note that casting the column does not improve the situation in this case - dist outer is better, but not what we are expecting */

explain
SELECT
    t1._key,
    t2._key
FROM
    test_dist_key_num t1
JOIN
    test_dist_key_int t2
 ON
    (
        CAST(t1._key AS INT) = t2._key) ;

/* XN Hash Join DS_DIST_OUTER  (cost=15.00..11669154.17 rows=6000 width=21) */

/* But changing the type of the column does */

explain
SELECT
    t1._key,
    t2._key
FROM
    test_dist_key_bigint t1
JOIN
    test_dist_key_int t2
 ON
    (
        t1._key = t2._key) ;

/*   XN Hash Join DS_DIST_NONE  (cost=15.00..1452.92 rows=6780 width=12)  */

explain
SELECT
    t1._key,
    t2._key
FROM
    test_dist_key_bigint_sortkey t1
JOIN
    test_dist_key_int_sortkey t2
 ON
    (
        t1._key = t2._key) ;

/* Merge Join */
