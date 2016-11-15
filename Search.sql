--Display Search Results
set linesize 350;
SELECT item_id, item_name, item_category, start_time, end_time, current_bid
FROM expanded_auction
WHERE item_category = 'Vehicles';
--  AND (
--    item_name LIKE '%Nimbus%' 
--    OR item_description LIKE '%Nimbus%'
--  )
--;