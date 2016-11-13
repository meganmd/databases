--to generate the page:
SELECT item_id, item_name, current_bid
FROM expanded_auction; --should make view for this

-- when user hits the "bid on item" button after entering a maximum bid limit:
INSERT INTO bid values(1, 'user1', CURRENT_TIMESTAMP, 30.00); --all these values except time entered from jdbc
