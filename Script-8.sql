-- Payment Captured but Not Shipped
-- Business Problem:
-- Finance teams want to ensure revenue is recognized properly. If payment is captured but no shipment has occurred, it warrants further review.

-- Fields to Retrieve:

-- ORDER_ID
-- ORDER_STATUS
-- PAYMENT_STATUS
-- SHIPMENT_STATUS


select oh.ORDER_ID , oh.STATUS_ID as ORDER_STATUS, opp.STATUS_ID as PAYMENT_STATUS,s.STATUS_ID as SHIPMENT_STATUS  from order_header oh 
join order_payment_preference opp on opp.ORDER_ID =oh.ORDER_ID 
AND OPP.STATUS_ID = 'PAYMENT_SETTLED' 
left join order_shipment os on os.ORDER_ID =oh.ORDER_ID 
left join shipment s on s.SHIPMENT_ID = os.SHIPMENT_ID and s.STATUS_ID != 'SHIPMENT_SHIPPED'
where oh.STATUS_ID not in ('ORDER_COMPLETED','ORDER_CANCELLED');



--EXPLANATION (APPROACH)
--It provides the ORDER_ID, ORDER_STATUS, PAYMENT_STATUS, and SHIPMENT_STATUS. The query filters for orders with a status other than 'ORDER_COMPLETED' or 'ORDER_CANCELLED' (beacuse in such cases shipments are made or not needed) and where the payment status is 'PAYMENT_SETTLED', but the shipment status is not 'SHIPMENT_SHIPPED'. 

--COST : 37912.44
