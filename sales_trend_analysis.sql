CREATE TABLE online_sales (
  order_id INT,
  order_date DATE,
  amount DECIMAL(10, 2),
  product_id INT
);

INSERT INTO online_sales VALUES
(1, '2023-01-05', 250.00, 101),
(2, '2023-01-18', 120.00, 102),
(3, '2023-02-02', 450.00, 101),
(4, '2023-02-15', 300.00, 103),
(5, '2023-03-07', 600.00, 102),
(6, '2023-03-29', 200.00, 101),
(7, '2023-04-12', 500.00, 104),
(8, '2023-04-20', 330.00, 103);

Query 1: Monthly Revenue and Order Volume
SELECT 
  EXTRACT(YEAR FROM order_date) AS year,
  EXTRACT(MONTH FROM order_date) AS month,
  SUM(amount) AS total_revenue,
  COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY year, month
ORDER BY year, month;

 Query 2: Top 3 Months by Revenue
SELECT 
  EXTRACT(YEAR FROM order_date) AS year,
  EXTRACT(MONTH FROM order_date) AS month,
  SUM(amount) AS total_revenue
FROM online_sales
GROUP BY year, month
ORDER BY total_revenue DESC
LIMIT 3;