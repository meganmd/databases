-- author = megan

--functions 

--get status of an auction
create or replace function get_status(item string) return string as
status varchar2(15);
begin
  select case
    when sysdate >= ( select start_time from auction where item_id = item)
    and sysdate <= (select end_time from auction where item_id = item)
    then 'ON AUCTION'
    when sysdate > (select end_time from auction where item_id = item)
    and exists (select * from bid where auction_id = item)
    then 'SOLD'
    when sysdate > (select end_time from auction where item_id = item)
    and not exists (select * from bid where auction_id = item)
    then 'NOT ON AUCTION'
    else 'ERROR'
  end into status
  from dual;
  
  return status;
end;

-- test with:
select get_status(3) from dual;

-- get current bid where current bid is the second highest maximum bid
-- used row numbers to select so that if multiple bids had the highest maximum 
-- bid value the query would pick the second ranking value for the current_bid
create or replace function get_current_bid(item string) return number as
current_bid integer;
begin
  select maximum_bid_limit into current_bid
  from (
    select maximum_bid_limit, row_number() over(order by maximum_bid_limit desc, bid_time asc) as rownumber
    from bid
    where auction_id = item
  )
  where rownumber = 2;
  return current_bid;
end;

--test
select auction_id, customer, MAXIMUM_BID_LIMIT from bid where AUCTION_ID = 3;
select get_current_bid(1) as current_bid from dual;


-- gets current winner where the winner is the first person to have the highest 
-- maximimum bid limit. Again, uses row numbers and ordering instead of 
-- equal to maximum to more easily return only one row.
create or replace function get_current_winner(item string) return string as
current_winner varchar(15);
begin
  select customer into current_winner
  from (
    select customer, row_number() over(order by maximum_bid_limit desc, bid_time asc) as rownumber
    from bid
    where auction_id = item
  )
  where rownumber = 1;
  return current_winner;
end;
  
-- test:
select auction_id, customer, MAXIMUM_BID_LIMIT from bid where AUCTION_ID = 3;
select get_current_winner(1) as current_winner from dual;

-- Checks if there exists an entry in the feedback table for a given auction.
create or replace function has_feedback(item string) return number as
has_feedback number;
begin
  select case 
    when exists(
      select * 
      from feedback
      where auction = item
    ) then 1 else 0
  end
  into has_feedback
  from dual;
  return has_feedback;
end;
