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

--get current bid
create or replace function get_current_bid(item string) return number as
current_bid integer;
begin
  select max(maximum_bid_limit) into current_bid
  from bid
  where maximum_bid_limit < (Select max(maximum_bid_limit) from bid where auction_id = item) and AUCTION_ID = item;
  
  return current_bid;
end;

--test
select auction_id, customer, MAXIMUM_BID_LIMIT from bid where AUCTION_ID = 3;
select get_current_bid(3) as current_bid from dual;


