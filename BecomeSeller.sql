--Author: Ellen

create or replace trigger become_seller
AFTER INSERT
ON AUCTION
for each row
Begin
  UPDATE ACCOUNT set IS_SELLER = '1';
end;
/
INSERT INTO AUCTION VALUES ('7', 'harrypotter', '01-SEP-2016','01-SEP-2017', 
  30.00, 'Potion', 'Pollyjuice', 'Misc');
SELECT * FROM ACCOUNT
WHERE username = 'harrypotter';


--This trigger changes the account information of a user when they post a new item for auction. The user's is_seller status is
--then changed to one, indicating that they are a seller. 