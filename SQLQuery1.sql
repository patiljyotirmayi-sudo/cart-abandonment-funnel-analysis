select * from [dbo].[cart_abandonment];
select count(*) from dbo.cart_abandonment;--5000


SELECT 
    SUM(reached_cart) AS total_cart_views,
    SUM(reached_shipping) AS reached_shipping,
    SUM(reached_payment) AS reached_payment,
    SUM(completed_purchase) AS total_purchases,
    -- Drop-off count from Cart to Shipping
    (SUM(reached_cart) - SUM(reached_shipping)) AS dropoff_cart_to_shipping,
    -- Drop-off count from Shipping to Payment (Usually the highest drop-off)
    (SUM(reached_shipping) - SUM(reached_payment)) AS dropoff_shipping_to_payment,
    -- Drop-off count from Payment to Purchase
    (SUM(reached_payment) - SUM(completed_purchase)) AS dropoff_payment_to_purchase
FROM dbo.cart_abandonment;

SELECT 
    SUM(reached_cart) AS total_cart_views,
    SUM(completed_purchase) AS total_purchases,
    -- Drop-off count from Cart to Shipping
   ROUND((SUM(reached_cart) - SUM(completed_purchase)) * 100.0 / NULLIF(SUM(reached_cart), 0), 2) AS shipping_to_payment_dropoff_pct
FROM dbo.cart_abandonment;

SELECT 
    product_category,
    device_type,
    SUM(reached_shipping) AS reached_shipping,
    SUM(reached_payment) AS reached_payment,
    -- Calculate percentage of users who drop off before payment
    ROUND((SUM(reached_shipping) - SUM(reached_payment)) * 100.0 / NULLIF(SUM(reached_shipping), 0), 2) AS shipping_to_payment_dropoff_pct
FROM cart_abandonment
GROUP BY product_category, device_type
ORDER BY shipping_to_payment_dropoff_pct DESC;