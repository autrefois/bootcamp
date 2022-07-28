-- drop table if exists bootcamp.df;

-- create table bootcamp.df (customer_code varchar(16),
--                  contract_code varchar(16),
--                  product varchar(16),
--                  num_products int);

-- insert into bootcamp.df values
-- ('C0134', 'AB01245', 'toy_1', 4),
-- ('B8328', 'EF28421', 'doll_4', 2);


-- select * from bootcamp.df;

-- with recursive nums (n) as 
-- ( select 1 as n
--   union all
--   select n+1 as n
--   from nums 
--   where n < (select max(num_products) from bootcamp.df) )
-- select row_number() over() as unique_id, customer_code, contract_code, product, num_products 
-- from bootcamp.df d
-- left join nums n
-- on d.num_products >= n.n;

-- drop table if exists bootcamp.df;

-- select * from pg_user;

alter schema laptop11_library owner to laptop11;
grant usage on schema laptop11_library to laptop11;
grant all on laptop11_library.tbl_accounts to laptop11;

grant all on laptop11_library.tbl_accounts to laptop11;



