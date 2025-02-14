select pf.PRODUCT_ID ,pf.FACILITY_ID ,pf.MINIMUM_STOCK as THRESHOLD
from product_facility pf 
join facility f 
on f.facility_id=pf.FACILITY_ID
where f.FACILITY_TYPE_ID = 'CONFIGURATION' and pf.MINIMUM_STOCK is not null ;



--EXPLANATION (APPROACH)
--- A facility whose facility type is CONFIGURATION and parent facility type is virtual then in such scenarios the minimum_stock is considered as threshold. so here we start with productFacility table and selects the facility whose type in configuration
