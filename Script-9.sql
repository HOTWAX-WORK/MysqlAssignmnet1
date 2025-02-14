select
count(*),
HOUR(OH.ORDER_DATE)
from order_header OH
where OH.STATUS_ID = 'ORDER_COMPLETED'
-- and OH.ORDER_DATE = 'DATE' --> IF I WANT FOR ANY PARTICULATR DATE
group by (hour(OH.ORDER_DATE))
order by (hour(OH.ORDER_DATE))



--EXPLANATION (APPROACH)

--It counts the number of completed orders (ORDER_COMPLETED status) and groups them by the hour of the ORDER_DATE. The result shows the total number of orders for each hour. An optional filter can be added to focus on a specific date.
