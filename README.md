# Sales-Trend-Analysis-Using-Aggregations

<img width="612" height="434" alt="image" src="https://github.com/user-attachments/assets/85531e02-71f8-421f-9abb-99aee6006dad" />

## 📌 Objective
Analyze monthly revenue and order volume using SQL aggregations to identify sales patterns, trends, and product performance.

**Tools Used:** MySQL

**Dataset:** `sales` table with columns:
- `order_id` (Order Identifier)
- `order_date` (Date of Order)
- `amount` (Order Amount)
- `product_id` (Product Identifier)

---

## 📊 Dataset Preview
| order_id | order_date | amount  | product_id |
|----------|------------|---------|------------|
| 1001     | 2024-01-05 | 250.00  | P101       |
| 1002     | 2024-01-15 | 450.00  | P102       |
| 1003     | 2024-02-03 | 300.00  | P103       |
| 1004     | 2024-02-20 | 150.00  | P104       |
| 1005     | 2024-03-12 | 600.00  | P105       |

---

## 📝 SQL Questions & Queries

### 1. Find the total monthly revenue for each month in 2024.
```sql
SELECT MONTHNAME(order_date) AS Month, ROUND(SUM(amount), 0) AS Monthly_Revenue
FROM sales 
GROUP BY MONTH(order_date), MONTHNAME(order_date)
ORDER BY MONTH(order_date);
```

2. Determine the total number of unique orders for each month.
```sql

SELECT MONTHNAME(order_date) AS Month, COUNT(DISTINCT product_id) AS No_of_Orders
FROM sales
GROUP BY MONTH(order_date), MONTHNAME(order_date)
ORDER BY MONTH(order_date);
```

3. Identify the top 3 months with the highest total revenue.
```sql

SELECT MONTHNAME(order_date) AS Month, ROUND(SUM(amount), 0) AS Highest_Revenue
FROM sales
GROUP BY MONTHNAME(order_date)
ORDER BY Highest_Revenue DESC
LIMIT 3;
```
4. Find the month with the lowest number of orders.
```sql

SELECT MONTHNAME(order_date) AS Month, COUNT(order_id) AS No_of_orders
FROM sales
GROUP BY MONTHNAME(order_date)
ORDER BY No_of_orders;
```

5. Calculate the average order amount per month.
```sql

SELECT MONTHNAME(order_date), ROUND(AVG(amount), 2) AS Avg_Revenue
FROM sales
GROUP BY MONTH(order_date), MONTHNAME(order_date)
ORDER BY MONTH(order_date);
```
6. Show the revenue trend from January to October 2024 in ascending month order.
```sql

SELECT MONTHNAME(order_date) AS Month, ROUND(SUM(amount), 0) AS Monthly_Revenue
FROM sales
GROUP BY MONTH(order_date), MONTHNAME(order_date)
ORDER BY MONTH(order_date);
```


7. Find the number of products sold per month.
```sql

SELECT MONTHNAME(order_date) AS Month, COUNT(product_id) AS Products_Sold
FROM sales
GROUP BY MONTH(order_date), MONTHNAME(order_date)
ORDER BY MONTH(order_date);
```

8. Display months where total revenue exceeded 1000.
```sql

SELECT MONTHNAME(order_date) AS Month, ROUND(SUM(amount), 0) AS Monthly_Revenue
FROM sales
GROUP BY MONTH(order_date), MONTHNAME(order_date)
HAVING SUM(amount) > 1000
ORDER BY MONTH(order_date);
```

9. Find the percentage contribution of each month’s revenue to the total yearly revenue.
```sql

SELECT 
    MONTHNAME(order_date) AS Month,
    ROUND(SUM(amount), 2) AS Monthly_Revenue,
    ROUND(
        (SUM(amount) / (SELECT SUM(amount) FROM sales)) * 100, 
        2
    ) AS Percentage_Contribution
FROM sales
GROUP BY MONTH(order_date), MONTHNAME(order_date)
ORDER BY MONTH(order_date);
```

10. Identify the month(s) where more than 5 unique products were sold.
```sql

SELECT MONTHNAME(order_date) AS Month, COUNT(DISTINCT product_id) AS Unique_Products
FROM sales
GROUP BY MONTH(order_date), MONTHNAME(order_date)
HAVING COUNT(DISTINCT product_id) < 5  
ORDER BY MONTH(order_date);
```

11. Show the month with the highest average order value.
```sql

SELECT MONTHNAME(order_date), ROUND(AVG(amount), 2) AS Avg_Revenue
FROM sales
GROUP BY MONTH(order_date), MONTHNAME(order_date)
ORDER BY Avg_Revenue DESC
LIMIT 1;
```

12. Get the total revenue for each product across all months and rank them by sales.
```sql

SELECT product_id, ROUND(SUM(amount), 0) AS Revenue, RANK() OVER(ORDER BY SUM(amount) DESC) AS Sales_Rank
FROM sales
GROUP BY product_id
ORDER BY Revenue DESC;
```

⚙️ How to Run This Project
1. Create a database
```sql

CREATE DATABASE online_sales;
USE online_sales;
```

2. Create the sales table
```sql

CREATE TABLE sales (
    order_id INT,
    order_date DATE,
    amount DECIMAL(10,2),
    product_id VARCHAR(10)
);
```

3. Import the dataset
Open MySQL Workbench or CLI

Use the LOAD DATA command (adjust file path to your system):

```sql

LOAD DATA INFILE '/path/to/online_sales.csv'
INTO TABLE sales
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, order_date, amount, product_id);
```

4. Run the queries
Copy-paste any of the above queries into your MySQL environment to view results.

📂 Files Included
online_sales.sql → SQL queries for all 12 questions

online_sales.csv → Dataset with 500+ rows

README.md → Project documentation

📈 Insights You Can Derive
Monthly revenue fluctuations

Best and worst-performing months

Average spending per order

High-performing products

Contribution of each month to yearly revenue

🔗 Author
Akhil Madanu
Portfolio: https://akhilmadanu.github.io




