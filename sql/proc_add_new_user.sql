create or replace Procedure PROC_ADD_NEW_USER(
    username1 varchar,password1 varchar, isadmin1 char, 
    phone1 char, email1 varchar, 
    fname1 varchar, lname1 varchar)
 AS
    Begin 
        INSERT INTO ACCOUNT (USERNAME, PASSWORD, PHONE, EMAIL, FNAME, LNAME, IS_ADMIN)
        VALUES (username1, password1, phone1, email1, fname, lname, isadmin1);      
    END;