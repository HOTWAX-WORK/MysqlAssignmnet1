-- Product IDs Across Systems
-- Business Problem:
-- To sync an order or product across multiple systems (e.g., Shopify, HotWax, ERP/NetSuite), the OMS needs to know each system’s unique identifier for that product. This query retrieves the Shopify ID, HotWax ID, and ERP ID (NetSuite ID) for all products.

-- Fields to Retrieve:

-- PRODUCT_ID (internal OMS ID)
-- SHOPIFY_ID
-- HOTWAX_ID
-- ERP_ID or NETSUITE_ID (depending on naming)

SELECT 
    P.PRODUCT_ID,
    MAX(CASE WHEN GI.GOOD_IDENTIFICATION_TYPE_ID = 'ERP_ID' THEN GI.ID_VALUE END) AS ERP_ID,
    MAX(CASE WHEN GI.GOOD_IDENTIFICATION_TYPE_ID = 'SKU' THEN GI.ID_VALUE END) AS HOTWAX_ID_SKU,
    MAX(CASE WHEN GI.GOOD_IDENTIFICATION_TYPE_ID = 'SHOPIFY_PROD_ID' THEN GI.ID_VALUE END) AS SHOPIFY_PRODUCT_ID
FROM 
    product P
JOIN 
    good_identification GI 
    ON P.PRODUCT_ID = GI.PRODUCT_ID
GROUP BY 
    P.PRODUCT_ID;
    
    
    
    --EXPLANATION (APPROACH)
    --It selects the PRODUCT_ID from the product table and uses conditional aggregation to retrieve the ERP_ID, HOTWAX_ID_SKU, and SHOPIFY_PRODUCT_ID from the good_identification table.The query groups results by PRODUCT_ID, returning each product’s identifiers for all the systems.


--COST : 2649970.53
