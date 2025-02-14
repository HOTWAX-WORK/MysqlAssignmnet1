SELECT 
    COUNT(*) AS TOTAL_ORDERS,
    SUM(oh.GRAND_TOTAL) AS TOTAL_REVENUE 
FROM 
    order_header oh 
LEFT JOIN 
    order_shipment os 
    ON oh.ORDER_ID = os.ORDER_ID 
    AND oh.SALES_CHANNEL_ENUM_ID = 'WEB_SALES_CHANNEL'
JOIN 
    shipment s 
    ON os.SHIPMENT_ID = s.SHIPMENT_ID 
    AND s.SHIPMENT_METHOD_TYPE_ID = 'STOREPICKUP'
WHERE 
    YEAR(oh.ORDER_DATE) = 'YEAR(CURDATE()) - 1';
    
    
    --EXPLANATION (APPROACH)
    
    -- It retrieves the total count of orders (TOTAL_ORDERS) and sums the GRAND_TOTAL (TOTAL_REVENUE) for orders made through the 'WEB_SALES_CHANNEL' and fulfilled using the 'STOREPICKUP' shipment method as we only need BOPIS orders. The results are filtered to include only orders from the previous year (YEAR(CURDATE()) - 1).
