copy bootcamp_rs.tbl_test
from 's3://edcdev-bootcamp/bootcamp_rs/copy_to_rs/test.csv'
iam_role 'arn:aws:iam::393503324041:role/RS-bootcamp'
IGNOREHEADER 1
DELIMITER ';'
region 'eu-central-1';