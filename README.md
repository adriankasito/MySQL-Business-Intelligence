# Customer and Order Analysis SQL Scripts

This repository contains SQL scripts for analyzing customer behavior, order trends, product sales, staff performance, and more. These scripts are useful for gaining insights into customer distribution, purchase frequency, revenue generation, and various other metrics. The analysis is structured to cover customers, orders, products, staff, stores, brands, and categories.

## Table of Contents
- [Customer Analysis](#customer-analysis)
- [Order Analysis](#order-analysis)
- [Product Analysis](#product-analysis)
- [Staff Analysis](#staff-analysis)
- [Store Analysis](#store-analysis)
- [Brand Analysis](#brand-analysis)
- [Category Analysis](#category-analysis)
- [How to Use](#how-to-use)
- [Prerequisites](#prerequisites)

---

## Customer Analysis
- **Total Customers by State and City**  
  Calculates the total number of customers in each state and city.

- **Top 10 Customers by Orders and Order Value**  
  Lists the top 10 customers based on the number of orders and total order value.

- **Customer Retention Rate**  
  Calculates the retention rate of customers over the last three months.

## Order Analysis
- **Total Orders by Month**  
  Displays the total number of orders placed each month, grouped by month and year.

- **Average Order Value by Category**  
  Calculates the average value of orders based on product categories.

- **Top 10 Products by Sales**  
  Lists the top 10 products based on the number of times they were purchased.

- **Order Fulfillment Rate**  
  Calculates the fulfillment rate of orders.

## Product Analysis
- **Product Distribution by Category**  
  Counts the number of unique categories and the distribution of products within each category.

- **Top 10 Products by Revenue**  
  Lists the top 10 products that generated the highest revenue.

- **Product Availability in Stores**  
  Displays the availability of products in each store.

- **Product Recommendation Engine**  
  Recommends products based on high-revenue orders.

## Staff Analysis
- **Staff Performance by Store & Orders**  
  Measures staff performance by the number of orders processed in each store.

- **Staff Sales by Product Category**  
  Calculates the revenue generated by each staff member per product category.

- **Staff Customer Retention Rate**  
  Shows customer retention rates for each staff member.

## Store Analysis
- **Store Sales by Product Category**  
  Displays the revenue generated by product categories in each store.

- **Store Inventory Levels**  
  Shows the inventory levels for each product in each store.

## Brand Analysis
- **Brand Distribution by Category**  
  Displays the distribution of brands within each product category.

- **Brand Sales by Product**  
  Shows sales performance by brand across products.

- **Brand Customer Loyalty**  
  Calculates customer loyalty rates for each brand.

## Category Analysis
- **Category Distribution by Store**  
  Shows the distribution of product categories within each store.

- **Category Sales by Product**  
  Calculates revenue by product within each category.

- **Category Customer Interest**  
  Measures customer interest in each category based on purchase patterns.

---

## How to Use
1. Clone this repository.
2. Execute each SQL script on your MySQL database as per your analysis requirements. Ensure the necessary tables (`customers`, `orders`, `order_items`, `products`, `categories`, `stocks`, `stores`, `staffs`) are available and structured as expected.
3. Modify table and column names as needed to fit your database schema.

## Prerequisites
- MySQL database with the required tables and data.
- Basic knowledge of SQL for executing and modifying queries.

---

Feel free to contribute and improve the analysis!
