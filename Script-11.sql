select count(*),os.CHANGE_REASON  from order_header oh 
join order_status os on oh.ORDER_ID = os.ORDER_ID  
and os.STATUS_ID = 'ORDER_CANCELLED' and os.STATUS_DATETIME between 
'2025-01-01' and '2025-01-31'
group by os.CHANGE_REASON;




--EXPLANATION (APPROACH)
--. It counts the number of canceled orders (TOTAL ORDERS) and groups them by the CHANGE_REASON field, which explains why each order was canceled. Also filters based on last month dates
