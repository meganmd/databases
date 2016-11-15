create or replace Procedure USER_MANAGEMENT_PROC(username1 varchar,password1 varchar, isadmin INTEGER, isseller INTEGER)
 AS
    Begin 
        INSERT INTO ACCOUNT (USERNAME, PASSWORD, IS_ADMIN, IS_SELLER)
        VALUES (username1, password1, isadmin, isseller);
        
        INSERT INTO ACCOUNT (USERNAME, PASSWORD, IS_ADMIN, IS_SELLER)
        VALUES (username1, password1, isadmin, isseller);
        
--      SELECT C.username,
--       C.fname,
--      C.lname,
--       C.email,
--       A.password
      
--FROM (CUSTOMER C JOIN ACCOUNT A ON C.USERNAME = A.USERNAME);

    END;