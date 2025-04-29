Create database Project;
use project;
select * from agent;
select * from buyers;
select * from properties;
select * from transactions;


-- 1 The Most Popular cities for property sales--
select p.city,count(t.transaction_id) as Sales_Frequency 
from transactions as t join properties as p
 on p.property_id=T.property_id Group by p.city
order by sales_frequency desc;



-- Top expensive property--

select property_id, address,city,price
from properties order by price desc limit 5;

-- Top Performing Agents based on number of sales--

select a.agent_id, a.first_name,a.last_name,count(t.transaction_id) as sales
from agent as a join properties as p on a.agent_id=p.agent_id
join transactions as t on p.property_id=t.property_id
group by a.agent_id, a.first_name,a.last_name
order by sales desc limit 5;

-- •  What is the total revenue generated from property sales?--

SELECT sum(sale_price) as total_revenue from transactions;

-- •  How many properties were sold by each agent?--
 
 select a.agent_id,a.first_name, a.last_name, count(transaction_id) as properties_Sold
 from agent as a join properties as p on a.agent_id=p.agent_id
 join transactions as t on p.property_id=t.property_id
 group by a.agent_id,a.first_name,a.last_name
 order by properties_sold desc;
 
 -- •  What is the average sale price of properties in each city?--

select city, avg(t.sale_price) AS Average_Sale_Price from transactions as t
join properties as p on t.property_id=p.property_id
group by city
order by average_sale_price desc;
 
 --  Which buyers purchased multiple properties?--

select b.buyer_id,b.first_name,b.last_name, count(t.transaction_id) as frequency_of_buyers
from buyers as b join transactions as t on b.buyer_id=t.buyer_id
group by b.buyer_id,b.first_name,b.last_name
having frequency_of_buyers > 1
order by frequency_of_buyers desc;
 
 -- •  What is the highest-priced property sold, and who was the buyer?-

 select b.buyer_id,b.first_name,b.last_name, (t.sale_price) as highest_property
 from buyers as b join transactions as t on b.buyer_id=t.buyer_id
 group by b.buyer_id,b.first_name,b.last_name,highest_property order by highest_property desc limit 1;
 
 -- •  Which agent had the highest total sales revenue?*/--

select a.agent_id,a.first_name,a.last_name, sum(sale_price) as highest_sales_by_agent
from agent as a join properties as p on a.agent_id=p.agent_id
join transactions as t on p.property_id=t.property_id
group by  a.agent_id,a.first_name,a.last_name
order by highest_sales_by_agent desc limit 1;

select a.agent_id, a.first_name,a.last_name,sum(t.sale_price) as Total_sales
from agent as a join properties as p on a.agent_id=p.agent_id
join transactions as t on p.property_id=t.property_id
group by a.agent_id, a.first_name,a.last_name
order by Total_sales desc limit 5;

select * from agent;
select * from buyers;
select * from properties;
select * from transactions;



-- What is the Lowest-priced property sold, and who was the buyer?
SELECT t.transaction_id, t.sale_price, t.sale_date,
b.first_name AS buyer_first_name, b.last_name AS buyer_last_name,
p.address, p.city, p.price AS listing_price,
a.first_name AS agent_first_name, a.last_name AS agent_Last_name from transactions t
JOIN buyers b ON t.buyer_id=b.buyer_id
JOIN properties p ON t.property_id=p.property_id
JOIN agent a ON p.agent_id = a.agent_id
ORDER BY t.sale_price asc limit 1;

