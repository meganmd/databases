-- author = megan

-- view expanded auction combines auction data with data from functions showing
-- current bid, current winner, and existance of feedback for an auction.
CREATE OR REPLACE VIEW expanded_auction AS
  SELECT item_id, seller, start_time, end_time, starting_price, 
  item_name, item_description, item_category, get_status(item_id) as status, 
  get_current_bid(item_id) as current_bid, get_current_winner(item_id) as 
  winner, has_feedback(item_id) as has_feedback
  FROM auction;
 