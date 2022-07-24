--sample encodings:
CREATE TABLE
    test_rs_00.rs_sample_encode
    (
        client_id INTEGER encode raw,
        client_first_name VARCHAR(100) encode text255,
        client_last_name VARCHAR(100) encode bytedict,
        load_tsp DATETIME DEFAULT SYSDATE encode lzo,
        PRIMARY KEY(client_id)
    ) ;

INSERT
INTO
    test_rs_00.rs_sample_encode
SELECT
    client_id,
    client_first_name,
    client_last_name,
    load_tsp
FROM
    test_rs_00.rs_sample_pk;

--table definition
SELECT
    *
FROM
    svv_Table_info
WHERE
    schema IN('test_rs_00')
AND "TABLE" IN('rs_sample_encode') ;


--column definitions
SELECT
    *
FROM
    SVV_COLUMNS
WHERE
    table_name = 'rs_sample_encode'
AND table_schema = 'test_rs_00';

--bloxks per columns
SELECT
    col,
    MAX(blocknum)
FROM
    stv_blocklist b,
    stv_tbl_perm p
WHERE
    (
        b.tbl = p.id)
AND name = 'rs_sample_encode'
AND col < 7
GROUP BY
    name,
    col
ORDER BY
    col;

SELECT
    *
FROM
    SVV_DISKUSAGE ;

SELECT
    col,
    COUNT(*)
FROM
    stv_blocklist,
    stv_tbl_perm
WHERE
    stv_blocklist.tbl = stv_tbl_perm.id
AND stv_blocklist.slice = stv_tbl_perm.slice
AND stv_tbl_perm.name = 'rs_sample_encode'
GROUP BY
    col
ORDER BY
    col;

SELECT
    col,
    COUNT(*)
FROM
    stv_blocklist,
    stv_tbl_perm
WHERE
    stv_blocklist.tbl = stv_tbl_perm.id
AND stv_blocklist.slice = stv_tbl_perm.slice
AND stv_tbl_perm.name = 'rs_sample_pk'
GROUP BY
    col
ORDER BY
    col;