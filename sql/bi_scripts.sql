--- Business insghts and data analysis for Yinc E-commerce Case Study ---

-- calculate the total sales amount for each order along side the individual product sales

select 
	o.order_id,
	p.product_id,
	p.price,
	o.quantity,
	o.total_price,
	sum(p.price * o.quantity) over (partition by o.order_id) as total_sales_amount
from 
	yinc.order o
join
	yinc.product p on o.product_id = p.product_id;


-- Calculate the running total price by order 

select
    order_id,
    product_id,
    quantity,
    total_price,
sum(total_price) over (order by order_id) as running_total_price
from 
	yinc.order;

-- rank products by their price within each category
	
select 
	*,
	rank() over (partition by category order by price desc) as price_rank_by_category
from 
	yinc.product;

-- calculate the cumulative quantity sold for each product
select 
    product_id,
    quantity,
    sum(quantity) over (partition by product_id order by order_id) as cumulative_quantity_sold
from 
	yinc.order;

-- rank customers by the total amount they have spent
select
	c.customer_id,
	c.customer_name,
	sum(total_price) as total_spent,
	rank() over (order by sum(total_price) desc) as customer_rank
from 
	yinc.customer c
join
	yinc.order o on c.customer_id = o.customer_id
group by 
	c.customer_id, 
	c.customer_name;

-- rank products by their total sales amount
select
	p.product_id,
	p.product_name,
	sum(quantity) as total_quantity_sold,
	sum(total_price) as total_sales_amount,
	rank() over (order by sum(total_price) desc) as product_rank
from 
	yinc.product p
join 
	yinc.order o on p.product_id = o.product_id
group by
	p.product_id,
	p.product_name;
	
-- rank orders by their total price
select 
	order_id,
	customer_name,
	total_price,
	rank() over (order by total_price desc) as order_rank
from 
	yinc.order o
join 
	yinc.customer c on o.customer_id = c.customer_id;

-- categorize the orders based on the total price.
select
	order_id,
	total_price,
	case
		when total_price >= 1000 then 'High'
		when total_price >= 50000 and total_price < 1000 then 'medium'
		else 'low'
	end as price_category
from 
	yinc.order;

--classify customers by the number of orders they made
select 
	c.customer_id,
	c.customer_name,
	count(o.order_id) as number_of_orders,
	case 
		when count(o.order_id) >= 20 then 'Frequent'
		when count(o.order_id) >= 10 and count(o.order_id) < 20 then 'Regular'
		else 'Occasional'
		end as order_frequency
from 
	yinc.customer c
join 
	yinc.order o on c.customer_id = o.customer_id
group by 
    c.customer_id,
	c.customer_name;


--classify products by their prices
select
	product_id,
	product_name,
	price,
	case
		when price >= 500 then 'Expensive'
		when price >= 100 and price < 500 then 'Moderate'
		else 'Affordable'
	end as price_category
from
	yinc.product;







