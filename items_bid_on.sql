select item_id, item_name, item_category, start_time, end_time, current_bid, winner
from expanded_auction 
natural join bid
where  customer = 'user1';