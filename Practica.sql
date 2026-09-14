-- Primer ejercicio Leetcode con SQL --
---------------------------------------------------
SELECT name, population, area
FROM world
WHERE area >= 3000000 OR population >= 25000000;

-- Segundo ejercicio leetcode con SQL --
---------------------------------------------------
SELECT product_id
FROM products
WHERE low_fats = 'Y' AND recyclable = 'Y';

-- tercer ejercicio leetcode con sql --
----------------------------------------------------
SELECT c.name AS Customers
FROM customers c
LEFT JOIN orders o
ON c.id = o.customerId
WHERE o.id IS NULL;

-- cuarto ejercicio leetcode con sql --
----------------------------------------------------

SELECT DISTINCT author_id AS id
FROM Views v 
WHERE v.author_id = v.viewer_id
ORDER BY v.author_id



