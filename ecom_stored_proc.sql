CREATE DEFINER=`root`@`localhost` PROCEDURE `get_supplier_service_type`()
BEGIN

Select SUPPLIER.SUPP_ID, SUPPLIER.SUPP_NAME, RATING.RAT_RATSTARS,
CASE
	WHEN RATING.RAT_RATSTARS=5 THEN 'Excellent Service'
    WHEN RATING.RAT_RATSTARS > 4 THEN 'Good Service'
    WHEN RATING.RAT_RATSTARS > 2 THEN 'Average Service'
    ELSE 'Poor Service'
END AS Type_of_Service
from SUPPLIER
inner join SUPPLIER_PRICING on SUPPLIER.SUPP_ID = SUPPLIER_PRICING.SUPP_ID
inner join `ORDER` on SUPPLIER_PRICING.pricing_id = `ORDER`.pricing_id
inner join RATING on `ORDER`.ORD_ID = RATING.ORD_ID;

END