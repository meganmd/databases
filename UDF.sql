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

