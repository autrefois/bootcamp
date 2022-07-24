--create table
CREATE TABLE
    test_rs_00.rs_sample_pk
    (
        client_id INTEGER,
        client_first_name VARCHAR(100),
        client_last_name VARCHAR(100),
        load_tsp DATETIME DEFAULT SYSDATE,
        PRIMARY KEY(client_id)
    ) ;

INSERT
INTO
    test_rs_00.rs_sample_pk
    (
        client_id,
        client_first_name,
        client_last_name
    )
    VALUES
    (
        1,
        'Ion',
        'Nicolae'
    )
    ,
    (
        2,
        'Agache',
        'Ionel'
    )
    ,
    (
        3,
        'velicu',
        'Mihai'
    )
    ,
    (
        4,
        'Floricel',
        'Catalina'
    )
    ,
    (
        1,
        'Gheorghe',
        'Vasile'
    )
    ,
    (
        1,
        'Paisa',
        'Razvan'
    )
    ,
    (
        2,
        'Fono',
        'Ilie'
    ) ;


SELECT
    COUNT(1)
FROM
    test_rs_00.rs_sample_pk;


SELECT
    *
FROM
    test_rs_00.rs_sample_pk;

SELECT
    client_id
FROM
    test_rs_00.rs_sample_pk
GROUP BY
    client_id
HAVING
    COUNT(1) > 1;

SELECT
    *
FROM
    test_rs_00.rs_sample_pk
WHERE
    client_id IN(1,
                 2) ;

/**sample of using PK as unique key, but not enforced*/
SELECT
    s.*
FROM
    test_rs_00.rs_sample_pk s
WHERE
    client_id IN
    (
     SELECT
            client_id
       FROM
            test_rs_00.rs_sample_pk
   GROUP BY
            client_id
     HAVING
            COUNT(1) > 1) ;


;