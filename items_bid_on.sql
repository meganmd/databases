--author = megan

-- Given a user, this query will select all auctions that user has bid on.
-- Columns selected are those that will be displayed on the items bid on page.
select item_id, item_name, item_category, start_time, end_time, current_bid, winner
from expanded_auction 
natural join bid
where  customer = 'user1'; -- whichever user you want to see