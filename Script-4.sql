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
