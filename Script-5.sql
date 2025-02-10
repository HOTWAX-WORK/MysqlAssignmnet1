select  p.PRODUCT_ID  , p.PRODUCT_TYPE_ID ,
f.PRODUCT_STORE_ID ,oi.QUANTITY 
,p.INTERNAL_NAME ,f.FACILITY_ID ,
oh.EXTERNAL_ID ,f.FACILITY_TYPE_ID , 
oh2.ORDER_HISTORY_ID ,oh.ORDER_ID ,
oi.ORDER_ITEM_SEQ_ID ,oi.SHIP_GROUP_SEQ_ID 
from order_header oh 
join order_status os on oh.order_id=os.ORDER_ID and os.STATUS_ID = 'ORDER_COMPLETED'
and  os.STATUS_DATETIME between '2023-08-01	' and '2023-08-31' 
join order_history oh2 on oh.ORDER_ID = oh2.ORDER_ID
join order_item oi on OH2.ORDER_ID =OI.ORDER_ID  and oh2.ORDER_ITEM_SEQ_ID = oi.ORDER_ITEM_SEQ_ID 
join product p on P.PRODUCT_ID =OI.PRODUCT_ID 
join order_item_ship_group oisg on oh2.ORDER_ID =oisg.ORDER_ID and oh2.SHIP_GROUP_SEQ_ID = oisg.SHIP_GROUP_SEQ_ID 
join facility f on oisg.FACILITY_ID =f.FACILITY_ID ;