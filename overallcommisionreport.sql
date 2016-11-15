--View Overalll Commission Report
CREATE OR REPLACE VIEW OVERALL_COMMISION_REPORT_View AS
SELECT C.USERNAME,
       C.FNAME,
       C.LNAME,
       C.EMAIL,
       F.OVERALL_RATING,
       B.MAXIMUM_BID_LIMIT *0.05 AS "COMMISSION"
       
FROM BID B
  JOIN CUSTOMER C ON C.USERNAME = B.CUSTOMER 
  JOIN FEEDBACK F ON B.AUCTION_ID = F.AUCTION

ORDER BY C.USERNAME;