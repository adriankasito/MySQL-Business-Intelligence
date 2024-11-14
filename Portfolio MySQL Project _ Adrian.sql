-- CUSTOMER ANALYSIS
-- Total customers per state
Alter table customers
add column full_name varchar(100) as (concat(first_name, ' ', last_name)
);

select state, count(*)
from customers
group by state;

-- Total customers per city
select city, count(*) 
from customers
group by city;

-- Top 10 customers by orders and order value
select * from order_items;

SELECT 
    c.full_name, 
    COUNT(o.customer_id) AS purchases 
FROM 
    data_analysis.orders AS o 
INNER JOIN 
    data_analysis.customers AS c 
        ON o.customer_id = c.customer_id 
GROUP BY 
    c.full_name 
ORDER BY 
    purchases DESC 
LIMIT 10;

SELECT 
    c.full_name, 
    sum(oo.list_price) AS purchases_value
FROM 
    data_analysis.orders AS o 
INNER JOIN 
    data_analysis.customers AS c 
        ON o.customer_id = c.customer_id 
inner join
	data_analysis.order_items as oo
		on o.order_id = oo.order_id
GROUP BY 
    c.full_name 
ORDER BY 
    purchases_value DESC 
LIMIT 10;

-- Customer retention rate
select * from data_analysis.orders;
    
	SELECT 
		COUNT(DISTINCT o.customer_id) / 
		(SELECT COUNT(*) FROM data_analysis.orders) AS retention_rate
	FROM 
		data_analysis.orders o
	WHERE 
		o.order_date > DATE_SUB((SELECT MAX(order_date) FROM data_analysis.orders), INTERVAL 3 month);
        
-- ORDER ANALYSIS
-- Total order by month
select * from data_analysis.products;

SELECT 
    MONTHNAME(order_date) AS months, 
    COUNT(*) AS number_of_orders, 
    YEAR(order_date) as years
FROM 
    data_analysis.orders
GROUP BY 
    MONTHNAME(order_date),
    YEAR(order_date);
    
-- Average order value by category
select * from data_analysis.orders;

select 
	avg(oo.list_price) as average_value,
    cc.category_name
from 
	data_analysis.order_items as oo
inner join 
	data_analysis.products as p
    on oo.product_id = p.product_id
inner join 
	data_analysis.categories as cc
    on p.category_id = cc.category_id
group by
	cc.category_name
order by
    average_value;
    
 
-- Top 10 products by sales
select * from data_analysis.order_items;

select 
	oo.product_id, sum(oo.product_id) as Times_purchased, p.product_name
from 
	data_analysis.order_items as oo
inner join
	data_analysis.products as p
    on p.product_id = oo.product_id
group by 
	p.product_name, oo.product_id
order by 
	Times_purchased desc
limit 10 

-- Order Fulfilment Rate
select * from data_analysis.order_items;

SELECT
  COUNT(DISTINCT order_id) / (SELECT COUNT(*) FROM orders) AS fulfillment_rate
FROM
  order_items;
 
-- PRODUCT ANALYSIS
-- Product Distribution By Category
select * from data_analysis.categories;
  
SELECT COUNT(DISTINCT category_id) AS unique_category_count
FROM data_analysis.products;
  
select 
	cc.category_name, p.category_id, count(*) as products_in_category_count
from 
	data_analysis.products as p
inner join
	data_analysis.categories as cc
    on p.category_id = cc.category_id
group by
	cc.category_name, p.category_id
order by
	products_in_category_count DESC;


-- 10 Ten Products By Revenue
select * from data_analysis.orders;


SELECT 
	p.product_id, SUM(oo.quantity * oo.list_price) AS Revenue
FROM 
	data_analysis.orders as o 
JOIN 
	data_analysis.order_items as oo
	ON o.order_id = oo.order_id 
JOIN data_analysis.products as p 
	ON oo.product_id = p.product_id 
GROUP BY product_id 
ORDER BY Revenue DESC
LIMIT 10;
	
    
-- PRODUCT Availability In Stores   
SELECT 
	store_id, product_id, COUNT(product_id) 
FROM 
	data_analysis.stocks 
GROUP BY store_id, product_id



-- PRODUCT Recommendation Engine
select * from data_analysis.orders;

SELECT
    oo.product_id,
    COUNT(DISTINCT oo.order_id) AS order_count
FROM
    data_analysis.order_items AS oo
JOIN
    (
        SELECT order_id
        FROM data_analysis.order_items
        GROUP BY order_id
        HAVING SUM(quantity * list_price) > 100
    ) AS high_revenue_orders
    ON oo.order_id = high_revenue_orders.order_id
GROUP BY
    oo.product_id
ORDER BY
    order_count DESC;
    
    
    
-- STAFF ANALYSIS
-- Staff Performance By Store & Orders
SELECT store_id, staff_id, COUNT(DISTINCT order_id) AS store_orders
FROM data_analysis.orders 
GROUP BY store_id, staff_id    


-- Staff Sales By Product Category
select * from data_analysis.order_items;

SELECT 
	o.staff_id, p.category_id, SUM(oo.quantity * oo.list_price) AS Revenue 
FROM data_analysis.orders as o
JOIN data_analysis.order_items as oo
	ON o.order_id = oo.order_id 
JOIN data_analysis.products as p
	ON oo.product_id = p.product_id 
GROUP BY o.staff_id, p.category_id

-- Staff Customer Retention Rate
SELECT 
	o.staff_id, COUNT(DISTINCT o.customer_id) / (SELECT COUNT(*) FROM data_analysis.orders) AS retention_rate 
FROM 
	data_analysis.orders as o 
GROUP BY
    o.staff_id
ORDER BY 
	o.staff_id DESC;
    
-- STORE ANALYSIS

-- Store Sales By Product Category
SELECT o.store_id, p.category_id, SUM(oo.quantity * oo.list_price) AS Revenue  
FROM data_analysis.orders as o 
JOIN data_analysis.order_items as oo
	ON o.order_id = oo.order_id 
JOIN data_analysis.products as p
    ON oo.product_id = p.product_id 
GROUP BY o.store_id, p.category_id

-- Store Inventory Levels
select * from data_analysis.stocks;


SELECT 
	st.store_id, st.product_id, st.quantity 
FROM 
	data_analysis.stocks as st
    
    
-- BRAND ANALYSIS

-- Brand distribution By Category
SELECT 
	p.brand_id, p.category_id, COUNT(*) as category_count
FROM 
	data_analysis.products as p 
GROUP BY p.brand_id, p.category_id

-- Brand Sales By Product
select * from data_analysis.products;

-- Brand Customer Loyalty
SELECT 
p.brand_id, COUNT(DISTINCT o.customer_id) / (SELECT COUNT(*) FROM data_analysis.orders) AS loyalty_rate 
FROM 
data_analysis.orders as o
JOIN 
	data_analysis.order_items as oo
    ON o.order_id = oo.order_id 
JOIN 
	data_analysis.products as p
    ON oo.product_id = p.product_id 
GROUP BY p.brand_id
ORDER BY p.brand_id DESC;


-- CATEGORY ANALYSIS
-- Category Distribution By Store
select * from data_analysis.stocks;
SELECT 
	ss.store_id, p.category_id, COUNT(*) 
FROM 
	data_analysis.products as p
JOIN
	data_analysis.stocks as ss
    ON p.product_id = ss.product_id
GROUP BY ss.store_id, p.category_id

-- Category Sales By Product
select * from data_analysis.products;


SELECT 
	p.category_id, p.product_id, SUM(oo.quantity * oo.list_price) AS Revenue 
FROM 
	data_analysis.orders as o
JOIN 
	data_analysis.order_items as oo
    ON o.order_id = oo.order_id 
JOIN 
	data_analysis.products as p
    ON oo.product_id = p.product_id 
GROUP BY p.category_id, p.product_id


-- Category Customer Interest
 SELECT 
	p.category_id, COUNT(DISTINCT customer_id) / (SELECT COUNT(*) FROM data_analysis.orders) AS interest_rate 
 FROM 
	data_analysis.orders as o
 JOIN 
	data_analysis.order_items as oo
	ON o.order_id = oo.order_id 
 JOIN 
	data_analysis.products as p
	ON oo.product_id = p.product_id 
 GROUP BY p.category_id
 ORDER BY interest_rate DESC;