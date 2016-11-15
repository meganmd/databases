--User List
--Allows administrator to view users
CREATE OR REPLACE VIEW USER_LIST_View AS
--SET LINESIZE 300;
--SET PAGESIZE 300;

SELECT C.username,
       C.fname,
       C.lname,
       C.email,
      A.password
      
FROM (CUSTOMER C JOIN ACCOUNT A ON C.USERNAME = A.USERNAME);
