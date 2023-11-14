-- CROSS JOIN or CARTESIAN JOIN
-- Every ROW in the first table it will Join with every other row in the other Table
-- Since we had 3 ros in first table and 3 rows in second table we will get 9 rows in total

SELECT *
FROM food_db.items 
CROSS JOIN food_db.variants;

SELECT *,
CONCAT(name," - ",variant_name) as full_name,
(price + variant_price) as full_price
FROM food_db.items 
CROSS JOIN food_db.variants;

