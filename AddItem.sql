--Author = Ellen

Create or Replace Procedure AUCTION_ADD_ITEM (id1 int, seller VARCHAR, 
  auctionStart timestamp, auctionEnd timestamp, startBid int, itemName VARCHAR, 
  description VARCHAR, category VARCHAR)
AS
    Begin 
        INSERT INTO AUCTION (ITEM_ID, SELLER, START_TIME, END_TIME, 
        STARTING_PRICE, ITEM_NAME, ITEM_DESCRIPTION, ITEM_CATEGORY)
        VALUES (id1, seller, auctionStart, auctionEnd, startBid, itemName, description, category);
    END;
/

begin
AUCTION_ADD_ITEM('5', 'harrypotter', TO_TIMESTAMP('11/11/2016 12:00.12', 'dd/mm/yyyy hh24:mi.ss'), 
  TO_TIMESTAMP('17/11/2016 12:00.00', 'dd/mm/yyyy hh24:mi.ss'), 
  '10', 'Calendar of Norway', 'A picture of Norway for every month.', 'fun');
end;