-- Products Missing NetSuite ID
-- Business Problem:
-- A product cannot sync to NetSuite unless it has a valid NetSuite ID. The OMS needs a list of all products that still need to be created or updated in NetSuite.

-- Fields to Retrieve:

-- PRODUCT_ID
-- INTERNAL_NAME
-- PRODUCT_TYPE_ID
-- NETSUITE_ID (or similar field indicating the NetSuite ID; may be NULL or empty if missing)

select p.product_Id,p.INTERNAL_NAME,p.PRODUCT_TYPE_ID,gi.GOOD_IDENTIFICATION_TYPE_ID
from product p
join good_identification gi on gi.PRODUCT_ID =p.PRODUCT_ID 
where gi.GOOD_IDENTIFICATION_TYPE_ID='ERP_ID' and gi.ID_VALUE is null;


--EXPLANATION (APPROACH)
---It selects the PRODUCT_ID, INTERNAL_NAME, PRODUCT_TYPE_ID from the product table and the GOOD_IDENTIFICATION_TYPE_ID from the good_identification table where the GOOD_IDENTIFICATION_TYPE_ID is 'ERP_ID' (representing the NetSuite ID) and the ID_VALUE is null, indicating that the product either lacks or has an invalid NetSuite ID and needs to be updated in NetSuite.

-- COST : 2.19
