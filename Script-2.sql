select p.PRODUCT_ID,p.PRODUCT_TYPE_ID,p.INTERNAL_NAME from product p
join product_type pt on p.PRODUCT_TYPE_ID = pt.PRODUCT_TYPE_ID 
where pt.IS_PHYSICAL = 'Y';


-- I have started with product table as i want product related fields i.e. product_id, product_type, and internal name but here i only want the physical products so i need to make a join with product type table as it has a field that tell weather a product is physical or on i.e. IsPhysical.
