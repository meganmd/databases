--View Overalll Commission Report
CREATE OR REPLACE VIEW OVERALL_COMMISION_REPORT_View AS
SELECT account.USERNAME as username,
       FNAME,
       LNAME,
       EMAIL,
       seller_average_rating(account.username) as rating,
       seller_number_of_auctions(account.username) as commissions
       
FROM account left join customer on account.username = customer.username
where exists (
  Select * from auction 
  where seller = account.username
);