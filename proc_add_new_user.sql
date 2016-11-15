create or replace Procedure PROC_ADD_NEW_USER(username1 varchar,password1 varchar, isadmin char, isseller char, phone char, email varchar, fname varchar, lname varchar)
 AS
    Begin 
        INSERT INTO ACCOUNT (USERNAME, PASSWORD, IS_ADMIN, IS_SELLER)
        VALUES (username1, password1, isadmin, isseller);
        
        INSERT INTO CUSTOMER (USERNAME,PHONE, EMAIL, FNAME, LNAME) 
        VALUES (username1, phone, email, fname, lname);
      
    END;