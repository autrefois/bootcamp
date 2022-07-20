UNLOAD ('select * from bootcamp_examples.tbl_numerics') to 's3://edcdev-bootcamp/bootcamp_rs/tbl_numerics'
iam_role 'arn:aws:iam::393503324041:role/RS-bootcamp'
PARALLEL OFF
maxfilesize 128 MB
ALLOWOVERWRITE
DELIMITER ';'
ADDQUOTES
ESCAPE
GZIP