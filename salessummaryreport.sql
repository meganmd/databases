--View Sales Summary Report
CREATE OR REPLACE VIEW SALES_SUMMARY_REPORT_View AS

SELECT 
A.ITEM_CATEGORY,
A.ITEM_ID, 
A.ITEM_NAME,
A.current_bid,
A.current_bid * 0.05 as commission

FROM expanded_auction A
where status = 'SOLD';