/*create a new schema */
CREATE schema
IF NOT EXISTS test_RS_01;
COMMIT;

/*check if the schema has specified a quota*/
SELECT
    *
FROM
    SVV_SCHEMA_QUOTA_STATE;
    
    
/*sample alter schema name*/   
ALTER schema test_RS_01 RENAME TO test_RS_00 ;
COMMIT;


/*sample for quota applied on Schema*/
ALTER schema test_RS_00 quota 2GB;

/*grant usage on schema to group/user*/
GRANT USAGE ON test_RS_00 to group bootcamp2022;

