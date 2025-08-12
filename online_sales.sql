use online_sales;
select * from sales;

#1.	Find the total monthly revenue for each month in 2024.

select monthname(order_date) as Month,round(sum(amount),0) as Monthly_Revenue
from sales 
group by month(order_date),monthname(order_date)
order by month(order_date);



#2.	Determine the total number of unique orders for each month.
select monthname(order_date) as Month, count(distinct product_id) as No_of_Orders
from sales
group by month(order_date),monthname(order_date)
order by month(order_date);


#3.	Identify the top 3 months with the highest total revenue.
select monthname(order_date) as Month,round(sum(amount),0) as Highest_Revenue
from sales
group by monthname(order_date)
order by Highest_Revenue desc
limit 3;

#4.	Find the month with the lowest number of orders.
select monthname(order_date) as Month,count(order_id) as No_of_orders
from sales
group by monthname(order_date)
order by No_of_orders;


#5.	Calculate the average order amount per month.
select monthname(order_date),round(Avg(amount),2) as Avg_Revenue
from sales
group by month(order_date),monthname(order_date)
order by month(order_date);

#6.	Show the revenue trend from January to October 2024 in ascending month order.
select monthname(order_date) as Month, round(sum(amount),0) as Monthly_Revenue
from sales
group by month(order_date),monthname(order_date)
order by month(order_date);

#7.	Find the number of products sold per month.
select monthname(order_date) as Month, count(product_id) as Products_Sold
from sales
group by month(order_date),monthname(order_date)
order by month(order_date);


#8.	Display months where total revenue exceeded 1000.
select monthname(order_date) as Month, round(sum(amount),0) as Monthly_Revenue
from sales
group by month(order_date),monthname(order_date)
having sum(amount) > 1000
order by month(order_date);


#9.	Find the percentage contribution of each month’s revenue to the total yearly revenue.
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


#10. Identify the month(s) where more than 5 unique products were sold.
select monthname(order_date) as Month, count(distinct product_id) as Unique_Products
from sales
group by month(order_date),monthname(order_date)
having count(distinct product_id) < 5  
order by month(order_date);


#11. Show the month with the highest average order value.
select monthname(order_date),round(Avg(amount),2) as Avg_Revenue
from sales
group by month(order_date),monthname(order_date)
order by Avg_Revenue desc
limit 1;


#12. Get the total revenue for each product across all months and rank them by sales.
select product_id,round(sum(amount),0) as Revenue,rank() over(order by sum(amount) desc) as Sales_Rank
from sales
group by product_id
order by Revenue desc;







