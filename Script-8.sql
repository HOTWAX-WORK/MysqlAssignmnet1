select oh.ORDER_ID , oh.STATUS_ID as ORDER_STATUS, opp.STATUS_ID as PAYMENT_STATUS,s.STATUS_ID as SHIPMENT_STATUS  from order_header oh 
join order_payment_preference opp on opp.ORDER_ID =oh.ORDER_ID 
AND OPP.STATUS_ID = 'PAYMENT_SETTLED' 
left join order_shipment os on os.ORDER_ID =oh.ORDER_ID 
left join shipment s on s.SHIPMENT_ID = os.SHIPMENT_ID and s.STATUS_ID != 'SHIPMENT_SHIPPED'
where oh.STATUS_ID not in ('ORDER_COMPLETED','ORDER_CANCELLED');