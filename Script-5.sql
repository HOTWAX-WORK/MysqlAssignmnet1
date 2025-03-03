-- Completed Orders in August 2023
-- Business Problem:
-- After running similar reports for a previous month, you now need all completed orders in August 2023 for analysis.

-- Fields to Retrieve:

-- PRODUCT_ID
-- PRODUCT_TYPE_ID
-- PRODUCT_STORE_ID
-- TOTAL_QUANTITY
-- INTERNAL_NAME
-- FACILITY_ID
-- EXTERNAL_ID
-- FACILITY_TYPE_ID
-- ORDER_HISTORY_ID
-- ORDER_ID
-- ORDER_ITEM_SEQ_ID
-- SHIP_GROUP_SEQ_ID


select  p.PRODUCT_ID  , p.PRODUCT_TYPE_ID ,
oh.PRODUCT_STORE_ID ,oi.QUANTITY 
,p.INTERNAL_NAME ,f.FACILITY_ID ,
oh.EXTERNAL_ID ,f.FACILITY_TYPE_ID , 
oh2.ORDER_HISTORY_ID ,oh.ORDER_ID ,
oi.ORDER_ITEM_SEQ_ID ,oi.SHIP_GROUP_SEQ_ID 
from order_header oh 
join order_status os on oh.order_id=os.ORDER_ID and os.STATUS_ID = 'ORDER_COMPLETED'
and  os.STATUS_DATETIME between '2023-08-01' and '2023-08-31' 
left join order_history oh2 on oh.ORDER_ID = oh2.ORDER_ID
left join order_item oi on OH2.ORDER_ID =OI.ORDER_ID  and oh2.ORDER_ITEM_SEQ_ID = oi.ORDER_ITEM_SEQ_ID 
left join product p on P.PRODUCT_ID =OI.PRODUCT_ID 
left join order_item_ship_group oisg on oh2.ORDER_ID =oisg.ORDER_ID and oh2.SHIP_GROUP_SEQ_ID = oisg.SHIP_GROUP_SEQ_ID 
left join facility f on oisg.FACILITY_ID =f.FACILITY_ID ;


--EXPLANATION (APPROACH)

-- QUERY START WITH ORDER_HEADER AS WE MAINLY NEED TO FETCH DATA ABOUT ORDER THAN JOINS ON ORDER_STATUS AS WE ONLY NEED COMPLETED ORDER THAT IS ALSO BETWEEN '2023-08-01' and '2023-08-31' THAN TO GET THE REMAINING DETAILS I HAVE MADE LEFT JOIN WITH THE TABLES CONTAINING RELEVANT FIELDS
