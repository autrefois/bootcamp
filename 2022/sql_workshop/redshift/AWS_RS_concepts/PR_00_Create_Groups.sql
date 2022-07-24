/*select all users from system table*/
SELECT
    *
FROM
    pg_user;
    
/*select all groups from system table*/
SELECT
    *
FROM
    pg_group;

/*create a new group*/
CREATE GROUP bootcamp2022 WITH USER laptop1, laptop10, laptop11, laptop12, laptop13, laptop14, laptop15, laptop16, laptop17, laptop18, laptop19, laptop2, laptop20, laptop3, laptop4, laptop5, laptop6, laptop7,
laptop8, laptop9;
COMMIT;
