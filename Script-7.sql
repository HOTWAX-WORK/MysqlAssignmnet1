select oh.ORDER_ID ,oh.GRAND_TOTAL ,opp.PAYMENT_METHOD_TYPE_ID  , oh.EXTERNAL_ID as ORDER_SHOPIFY_ID
from order_header oh
join order_payment_preference opp on oh.ORDER_ID =opp.ORDER_ID
where oh.STATUS_ID = 'ORDER_CREATED';