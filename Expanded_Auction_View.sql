CREATE OR REPLACE VIEW expanded_auction AS
  SELECT *
  FROM auction 
  join (
    SELECT current_bid_function as current_bid,
        status_function as status
    from idunno
  ) things natural join auction auct;
  