select
count(*),
HOUR(OH.ORDER_DATE)
from order_header OH
where OH.STATUS_ID = 'ORDER_COMPLETED'
-- and OH.ORDER_DATE = 'DATE' --> IF I WANT FOR ANY PARTICULATR DATE
group by (hour(OH.ORDER_DATE))
order by (hour(OH.ORDER_DATE))