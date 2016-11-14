select winner, item_id, overall_rating, quality_rating, delivery_rating, comments
from expanded_auction join feedback on expanded_auction.item_id = feedback.auction
where seller = 'user1';