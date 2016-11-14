select item_id, item_name, item_category, start_time, end_time, starting_price, 
  current_bid, seller, email, has_feedback(item_id) as has_feedback
from expanded_auction left join customer on seller = username
where status = sold and winner = 'user1';
