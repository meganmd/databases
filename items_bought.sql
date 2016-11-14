--author = megan

-- Given a user, this query will select items that user has bought, as defined
-- by being the winner of an auction that has ended. The query selects all 
-- columns necessary for the items bought page as well as whether the auction 
-- has feedback so the page can display a link to add feedback only when 
-- appropriate. The left join to customer is to get the seller's email, but 
-- because a seller is not required to enter their email, it may be null.
select item_id, item_name, item_category, start_time, end_time, starting_price, 
  current_bid, seller, email, has_feedback(item_id) as has_feedback
from expanded_auction left join customer on seller = username
where status = 'SOLD' and winner = 'user1';
