-- Creating DATABASE ----
create database final
    character set utf8mb4 collate utf8mb4_unicode_ci;
	
	
-- Creating USERS ----
CREATE USER 'reader'@'localhost'
Identified by 'r3aderOnlyPa$$';

CREATE USER 'transactions'@'localhost'
Identified by 'transacti0nsPa$$';

CREATE USER 'useradmin'@'localhost'
Identified by 'allTh3PowerPa$$';


-- Creating ROLES ----
CREATE ROLE 'readonly', 'transactiononly', 'admins';


-- Giving grants to roles ----
-- 	-- readonly role
GRANT SELECT on final.* to 'readonly';
GRANT show view on final.* to 'readonly';
--SHOW GRANTS FOR readonly;

-- 	-- transactiononly role
GRANT SELECT,INSERT,DELETE,UPDATE,SHOW VIEW on final.* to 'transactiononly';
--SHOW GRANTS FOR transactiononly;

-- -- admins ROLE
GRANT select,insert,update,delete,alter,
    index,references,drop,alter routine, 
    create routine,create, create view, 
    show view,execute, trigger
    on final.* to 'admins';
--SHOW GRANTS FOR admins;


-- Giving roles to USERS
GRANT 'readonly' to reader@localhost;
--SHOW GRANTS for reader@localhost USING readonly;

GRANT 'transactiononly' to transactions@localhost;
--SHOW GRANTS for transactions@localhost USING transactiononly;

GRANT 'admins' to useradmin@localhost;
--SHOW GRANTS for useradmin@localhost USING admins;


-- I forgot to set default role all to users. But everything still seems to work even though I added it after the fact
--(FYI - I was signed in as mysql root when I did this)
SET DEFAULT ROLE ALL to useradmin@localhost;
SET DEFAULT ROLE ALL to reader@localhost;
SET DEFAULT ROLE ALL to transactions@localhost;

-- I didn't realize there was an event grant so I have assigned it after the fact with this:
GRANT event on final.* to 'admins';

--To do the rest, I signed in as useradmin and selected my database.
use final;
