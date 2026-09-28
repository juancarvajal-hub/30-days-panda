-- Primer ejercicio Leetcode con SQL -------------
---------------------------------------------------
SELECT name, population, area
FROM world
WHERE area >= 3000000 OR population >= 25000000;

-- Segundo ejercicio leetcode con SQL -------------
---------------------------------------------------
SELECT product_id
FROM products
WHERE low_fats = 'Y' AND recyclable = 'Y';

-- tercer ejercicio leetcode con sql ---------------
----------------------------------------------------
SELECT c.name AS Customers
FROM customers c
LEFT JOIN orders o
ON c.id = o.customerId
WHERE o.id IS NULL;

-- cuarto ejercicio leetcode con sql ---------------
----------------------------------------------------

SELECT DISTINCT author_id AS id
FROM Views v 
WHERE v.author_id = v.viewer_id
ORDER BY v.author_id


-- Quinto ejercicio de letcode con sql -------------
----------------------------------------------------

SELECT tweet_id
FROM Tweets t
WHERE  LENGTH(content) > 15


-- Sexto ejercicio de leetcode con sql ------------
---------------------------------------------------   

SELECT employee_id,
CASE
    WHEN employee_id%2 != 0 AND SUBSTRING(name,1,1) != 'M'
    THEN salary
    ELSE 0
    END AS bonus
FROM Employees
ORDER BY employee_id ASC;

--- Septimo ejercicio de leetcode con sql ----------
----------------------------------------------------

SELECT user_id, CONCAT(UPPER(SUBSTRING(name, 1, 1)), LOWER(SUBSTRING(name, 2))) AS name
FROM Users
ORDER BY user_id ASC;


-- octavo ejercicio de sql ----------------------------
-------------------------------------------------------

SELECT *
FROM Users1
WHERE mail ~ '^[A-Za-z][A-Za-z0-9_.-]*@leetcode\.com$';


-------- Noveno Ejercico de sql -------------------------
---------------------------------------------------------

SELECT patient_id,
patient_name ,
conditions   
FROM Patients P
WHERE P.conditions LIKE 'DIAB1%' 
   OR P.conditions LIKE '% DIAB1%' ;


--------- decimo ejercicio de sql ------------------------
----------------------------------------------------------

WITH tbl1 AS( 
  SELECT DISTINCT salary AS NthHighestSalary,
  DENSE_RANK() OVER(ORDER BY salary DESC) AS conteo
FROM Employee
  )
SELECT MAX(NthHighestSalary) AS NthHighestSalary
FROM tbl1
WHERE conteo = 4;


---------------- Decimoprimero ejercicio de sql---------------
--------------------------------------------------------------

WITH tbl1 AS( 
  SELECT DISTINCT salary AS NthHighestSalary,
  DENSE_RANK() OVER(ORDER BY salary DESC) AS conteo
FROM Employee
  )
SELECT MAX(NthHighestSalary) AS NthHighestSalary
FROM tbl1
WHERE conteo = 2;

---------------- Decimosegundo ejercicio de sql --------------
--------------------------------------------------------------

SELECT 
    department.name AS department,
    b.name AS Employee,
    b.salary
FROM (SELECT 
    id,
    name,
    salary,
    departmentid,
    MAX(salary) OVER (PARTITION BY departmentid) AS max_sala
FROM employee) b
LEFT JOIN department ON b.departmentid = department.id
WHERE b.salary = b.max_sala; 


----------- decimotercer ejercicio de sql --------------------
---------------------------------------------------------------

SELECT
   score,
   DENSE_RANK() OVER (ORDER BY score DESC ) AS rank  
FROM scores;

---------- decimocuarto ejercicio de sql ---------------------
--------------------------------------------------------------

DELETE 
FROM Person
WHERE id IN (
    SELECT 
        id    -- Se eliminó la coma que estaba aquí
    FROM (
      SELECT 
      id, 
      ROW_NUMBER() OVER (PARTITION BY email ORDER BY id ASC) AS numero_fila
      FROM Person
    ) AS bd1 
    WHERE numero_fila > 1
);

------------- decimoquinto ejercicio de sql -------------------
---------------------------------------------------------------

SELECT
    p.product_id,
    unpivoted.store,
    unpivoted.price
FROM products p 
CROSS JOIN LATERAL (
  VALUES 
  ('store1',p.store1),
  ('store2',p.store2),
  ('store3',p.store3)
) AS unpivoted(store, price)
WHERE price IS NOT NULL
ORDER BY p.product_id;

---------------- decimosexto ejercicio de sql --------------------
------------------------------------------------------------------

WITH CategoriasMaestras AS (
    SELECT unnest(ARRAY['Low Salary', 'Average Salary', 'High Salary']) AS category
),
CuentasCategorizadas AS (
    SELECT 
        CASE 
            WHEN income < 20000 THEN 'Low Salary'
            WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
            ELSE 'High Salary'
        END AS category
    FROM Accounts
)
SELECT 
    c.category,
    -- CuentasCategorizadas.category,
    COUNT(CuentasCategorizadas.category)
FROM CategoriasMaestras c
LEFT JOIN CuentasCategorizadas ON c.category = CuentasCategorizadas.category
GROUP BY c.category; 

