-- author = megan

-- This select is used to generate the place bid page for a given item by 
-- getting the neccessary information about an auction to bid on.
set linesize 350;
SELECT item_id, item_name, current_bid
FROM expanded_auction
where item_id = 3; 

-- This query executes when user hits the "bid on item" button after entering 
-- a maximum bid limit to insert a new bid for an auction at the current time.
INSERT INTO bid values(1, 'user1', CURRENT_TIMESTAMP, 30.00); 
