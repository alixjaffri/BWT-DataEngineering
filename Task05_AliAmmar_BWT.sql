-- SYED MOHAMMAD ALI AMMAR
-- BYTEWISE LIMITED

-- TASK 05

--1)
select
    item_id, order_id, product_id, amount, total_amount, (amount / total_amount) * 100 as percentage_contribution
from (
    select item_id, order_id, product_id, amount, sum(amount) over (partition by order_id) as total_amount
    from items
) subquery
	
order by order_id, item_id;


--2)
select order_id, customer_id, total_amount,
	rank() over (partition by customer_id order by total_amount desc) as order_rank
	
from orders
order by customer_id, order_rank;


--3)
select s.supplier_id, s."name", avg(p.price) as average_price
from suppliers s
	
join products p on s.supplier_id = p.supplier_id
group by s.supplier_id
	
having count(p.product_id) > 0;


--4)
select c.category_id, c."name" as category_name, count(p.product_id) as product_count
from categories c
left join products p on c."name" = p.category
--left join so that all categories get including with the ones jinkay pass zero products hein
	
group by c.category_id
order by c.category_id;


--5)
select c.customer_id, c."name" as customer_name, c.phone,
    coalesce(sum(o.total_amount), 0) as total_amount_spent
	-- coalesce replaces the null amounts with 0 (customers with no orders)
from customers c
left join orders o on c.customer_id = o.customer_id
-- left join so all get included
	
group by c.customer_id
order by c.customer_id;


