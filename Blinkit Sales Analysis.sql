CREATE DATABASE Blinkkit;
USE blinkkit;

SHOW TABLES;
SELECT COUNT(*) FROM cutomer;
SELECT * FROM customer LIMIT 5;

SELECT * FROM customer;

-- 1. Find total number of orders placed?
SELECT COUNT(*) AS total_orders
FROM Orders;

-- 2. Find top 5 most expensive products?
SELECT product_name, price
FROM Products
ORDER BY price DESC 
LIMIT 5;

-- 3. Find customers who have placed more than 5 orders?
SELECT customer_id,
       COUNT(order_id) AS total_orders
FROM Orders
GROUP BY customer_id
HAVING COUNT(order_id) > 2;

-- 4.Calculate Total Revenue?
SELECT sum(order_total) as total_revenue 
FROM ORDERS;

-- 5.Calculate Total Spending by Each Customer
SELECT customer_id,
       SUM(order_total) AS total_spending
FROM orders
GROUP BY customer_id;

-- 6.Identify repeat customers?
SELECT customer_id,
       COUNT(order_id) AS total_orders
FROM Orders
GROUP BY customer_id
HAVING COUNT(order_id) > 1;

-- 7.Customers with more than 3 orders?
SELECT customer_id
FROM Orders
GROUP BY customer_id
HAVING COUNT(order_id) > 3;

-- 8. Highest priced product per category?
SELECT category, MAX(price)
FROM Products
GROUP BY category;

-- 9. Find first order date per customer?
SELECT customer_id, MIN(order_date)
FROM Orders
GROUP BY customer_id;

-- 10. Find last order date per customer?
SELECT customer_id, MAX(order_date)
FROM Orders
GROUP BY customer_id;

-- 11. Show customer name with their orders?
SELECT c.customer_name,
       o.order_id,
       o.order_date
FROM Customer c
INNER JOIN Orders o
ON c.customer_id = o.customer_id;

-- 12.Show customers who never placed an order (LEFT JOIN)?
SELECT c.customer_id,
       c.customer_name
FROM Customer c
LEFT JOIN Orders o
ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;

-- 13. Average product price per category?
SELECT category,
       AVG(price) AS avg_price
FROM Products
GROUP BY category;

-- 14. Find the Full Outer Join On Customer And Ordes?
SELECT c.customer_id,
       c.customer_name,
       o.order_id
FROM Customer c
LEFT JOIN Orders o
ON c.customer_id = o.customer_id
UNION
SELECT c.customer_id,
       c.customer_name,
       o.order_id
FROM Customer c
RIGHT JOIN Orders o
ON c.customer_id = o.customer_id;
