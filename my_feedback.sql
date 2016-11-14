-- author = megan

-- given a seller, this query will select any feedback that has been left for 
-- auctions they ran. Columns are appropriate for the seller's my feedback page.
select winner, item_id, overall_rating, quality_rating, delivery_rating, comments
from expanded_auction join feedback on expanded_auction.item_id = feedback.auction
where seller = 'user1';