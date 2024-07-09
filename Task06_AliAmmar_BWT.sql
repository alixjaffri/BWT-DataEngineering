-- SYED MOHAMMAD ALI AMMAR
-- BYTEWISE LIMITED

-- TASK 06

--1)
select o.order_id, c.customer_id, c."name" as customer_name, c.phone, o.order_timestamp, i.product_id, i.amount
from customers c
	
join orders o on c.customer_id = o.customer_id
join items i on o.order_id = i.order_id
	
order by o.order_id


--2)
select p.product_id, p."name" as product_name, s."name" as supplier_name, s.phone as supplier_phone, c."name" as category_name
from products p
	
join suppliers s on p.supplier_id = s.supplier_id
join categories c on p.category = c."name"
	
order by p.product_id;


--3)
select o.order_id, o.customer_id, o.status, o.order_timestamp, p."name" as product_name, i.product_id, i.amount as ordered_amount
from orders o
	
join items i on o.order_id = i.order_id
join products p on i.product_id = p.product_id
	
order by o.order_id, i.product_id;


--4)
select s.supplier_id, s."name" as supplier_name, c."name" as city_name, c.country as country_name, p.product_id, p."name" as product_name
from suppliers s
	
join cities c on s."location" = c."name"
join products p on s.supplier_id = p.supplier_id
	
order by s.supplier_id;


--5)
select lo.order_id, lo.customer_id, lo.order_timestamp, i.product_id, p."name" AS product_name, i.amount AS ordered_amount
from
(
    select o.order_id, o.customer_id, o.order_timestamp, row_number() over(partition by o.customer_id order by o.order_timestamp desc) as row_num
    from orders o
) lo
	
join items i on lo.order_id = i.order_id
join products p on i.product_id = p.product_id
	
where lo.row_num = 1
order by lo.customer_id;




