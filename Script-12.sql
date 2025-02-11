select pf.PRODUCT_ID ,pf.FACILITY_ID ,pf.MINIMUM_STOCK 
from product_facility pf 
join facility f 
on f.facility_id=pf.FACILITY_ID
where f.FACILITY_TYPE_ID = 'CONFIGURATION' and pf.MINIMUM_STOCK is not null ;