-- Products Missing NetSuite ID
-- Business Problem:
-- A product cannot sync to NetSuite unless it has a valid NetSuite ID. The OMS needs a list of all products that still need to be created or updated in NetSuite.

-- Fields to Retrieve:

-- PRODUCT_ID
-- INTERNAL_NAME
-- PRODUCT_TYPE_ID
-- NETSUITE_ID (or similar field indicating the NetSuite ID; may be NULL or empty if missing)

SELECT 
    p.product_id,
    p.internal_name,
    p.product_type_id,
    gi.id_value AS netsuite_id
FROM 
    product p
LEFT JOIN 
    good_identification gi 
    ON gi.product_id = p.product_id 
    AND gi.good_identification_type_id = 'ERP_ID'
WHERE 
    gi.id_value IS NULL OR gi.good_identification_type_id IS NULL;

-- COST : 2.19
