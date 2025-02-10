select p.product_Id,p.INTERNAL_NAME,p.PRODUCT_TYPE_ID,gi.GOOD_IDENTIFICATION_TYPE_ID
from product p
join good_identification gi on gi.PRODUCT_ID =p.PRODUCT_ID 
where gi.GOOD_IDENTIFICATION_TYPE_ID='ERP_ID' and gi.ID_VALUE is null;