--functions procedures and views

--get status
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

-- test:
select get_status(3) from dual;

--get current bid -- will fail when bids are equal
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

--  select max(maximum_bid_limit) into current_bid
--  from bid
--  where maximum_bid_limit < (Select max(maximum_bid_limit) from bid where auction_id = item) and AUCTION_ID = item;
--  
  return current_bid;
end;

--test
select auction_id, customer, MAXIMUM_BID_LIMIT from bid where AUCTION_ID = 3;
select get_current_bid(1) as current_bid from dual;


--get_current_winner (will currently fail with multiple equal bids)
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

--  select customer into current_winner
--  from bid
--  where maximum_bid_limit = (
--    Select max(maximum_bid_limit) from bid 
--    where auction_id = item) 
--  and auction_id = item;
  
  return current_winner;
end;
  
select auction_id, customer, MAXIMUM_BID_LIMIT from bid where AUCTION_ID = 3;
select get_current_winner(1) as current_winner from dual;


