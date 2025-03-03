-- Newly Created Sales Orders and Payment Methods
-- Business Problem:
-- Finance teams need to see new orders and their payment methods for reconciliation and fraud checks.

-- Fields to Retrieve:

-- ORDER_ID
-- TOTAL_AMOUNT
-- PAYMENT_METHOD
-- Shopify Order ID (if applicable)

select oh.ORDER_ID ,oh.GRAND_TOTAL ,opp.PAYMENT_METHOD_TYPE_ID  , oh.EXTERNAL_ID as ORDER_SHOPIFY_ID
from order_header oh
join order_payment_preference opp on oh.ORDER_ID =opp.ORDER_ID
where oh.STATUS_ID = 'ORDER_CREATED';



--EXPLANATION (APPROACH)
--It selects the ORDER_ID, GRAND_TOTAL (total amount), PAYMENT_METHOD_TYPE_ID (payment method), and EXTERNAL_ID (Shopify Order ID) from the order_header and order_payment_preference tables.Added join with order_payment_preference as it contains the relevant payment method information. The results are filtered to include only orders with a status of 'ORDER_CREATED', providing details on new orders and their payment methods for the specified purpose.

-- COST : 5882.28
