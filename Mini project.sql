USE pizza_sales;


SELECT DISTINCT category FROM pizza_types;


SELECT pizza_type_id, name, COALESCE(ingredients, 'Missing Data') AS ingredients_clean FROM pizza_types LIMIT 5;


SELECT * FROM pizzas WHERE price IS NULL;


SELECT * FROM orders WHERE order_date = '2015-01-01';


SELECT * FROM pizzas ORDER BY price DESC;


SELECT * FROM pizzas WHERE size IN ('L', 'XL');


SELECT * FROM pizzas WHERE price BETWEEN 15.00 AND 17.00;


SELECT * FROM pizza_types WHERE name LIKE '%Chicken%';


SELECT * FROM orders WHERE order_date = '2015-02-15' OR order_time > '20:00:00';


SELECT SUM(quantity) AS total_pizzas_sold FROM order_details;


SELECT AVG(price) AS avg_pizza_price FROM pizzas;


SELECT o.order_id, SUM(od.quantity * p.price) AS order_total_value 
FROM orders o 
JOIN order_details od ON o.order_id = od.order_id 
JOIN pizzas p ON od.pizza_id = p.pizza_id 
GROUP BY o.order_id;


SELECT pt.category, SUM(od.quantity) AS total_quantity_sold 
FROM order_details od 
JOIN pizzas p ON od.pizza_id = p.pizza_id 
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id 
GROUP BY pt.category;


SELECT pt.category, SUM(od.quantity) AS total_quantity_sold 
FROM order_details od 
JOIN pizzas p ON od.pizza_id = p.pizza_id 
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id 
GROUP BY pt.category 
HAVING SUM(od.quantity) > 5000;


SELECT p.pizza_id, p.pizza_type_id, p.size, p.price 
FROM pizzas p 
LEFT JOIN order_details od ON p.pizza_id = od.pizza_id 
WHERE od.pizza_id IS NULL;


SELECT p1.pizza_type_id, p1.size AS size_1, p1.price AS price_1, p2.size AS size_2, p2.price AS price_2, (p2.price - p1.price) AS price_difference 
FROM pizzas p1 
JOIN pizzas p2 ON p1.pizza_type_id = p2.pizza_type_id AND p1.size < p2.size;
