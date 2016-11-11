--Login


--User List
--Allows administrator to view users
SELECT C.username,
       C.fname,
       C.lname,
       C.email,
       C.password
FROM customer C;


--Add New User
--Inserts a new user into the database
INSERT INTO COMPANY_EMPLOYEE (USERNAME, FNAME, LNAME,EMAIL, PASSWORD) VALUES ('FILLIN', 'FILL', 'IN', 'example@example.com','password0123' );


--View Sales Summary Report
SELECT 
A.CATEGORY,
A.ITEM_ID, 
A.ITEM_NAME,
A.CURRENT_BID_VALUE,
A.CURRENT_BID_VALUE *0.05 AS COMMISSION
FROM AUCTION A
WHERE STATUS = 'SOLD';  --Im not sure how to do this yet


--View Overalll Commission Report
SELECT S.username,
       S.fname,
       S.lname,
       S.email,
       S.rating,
FROM SELLER S
WHERE EXISTS (
SELECT (A.CURRENT_BID_VALUE *0.05 AS COMMISSION
FROM AUCTION A
WHERE STATUS = 'SOLD'));
--Customer login



)