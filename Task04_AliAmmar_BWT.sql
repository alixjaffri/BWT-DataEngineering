-- Syed Mohammad Ali Ammar
-- Bytewise Limited
-- Task 04

-- Creating tables

CREATE TABLE categories(
	category_id VARCHAR(255) PRIMARY KEY,
	"name" VARCHAR (100) NOT NULL,
	status VARCHAR (50) NOT NULL,
	description TEXT NOT NULL
);

create table cities(
	city_id varchar(255) primary key,
	"name" varchar(100) not null,
	province varchar(100) not null,
	country varchar(50) not null,
	status varchar (50) not null
);

create table items(
	item_id varchar(255) primary key,
	order_id varchar(255) not null,
	product_id varchar(255) not null,
	amount decimal(10,2) not null,
	status varchar(50) not null,
	timestamp varchar(50) not null
);

create table customers(
	customer_id varchar(255) primary key,
	"name" varchar(100) not null,
	phone varchar(50) not null,
	"location" varchar(50) not null,
	status varchar(50) not null
);

create table orders(
	order_id varchar(255) primary key,
	customer_id varchar(255) not null,
	status varchar(50) not null,
	order_timestamp varchar(50) not null,
	total_amount decimal(10,2) not null
);

create table products(
	product_id varchar(255) primary key,
	"name" varchar(100) not null,
	supplier_id varchar(255) not null,
	category varchar(100) not null,
	price decimal(10,2) not null,
	stock_available int not null,
	status varchar(50) not null,
	product_createtimestamp varchar(50) not null
);



create table suppliers(
	supplier_id varchar(255) not null,
	"name" varchar(100) not null,
	phone varchar(50) not null,
	"location" varchar(50) not null,
	status varchar(50) not null,
	category varchar(100) not null
);


-- Inserting data from "CSV" files now
copy public."categories" from 'E:\Bytewise\Task04\categories.csv' DELIMITER ',' CSV HEADER;
copy public."cities" from 'E:\Bytewise\Task04\cities.csv' DELIMITER ',' CSV HEADER;
copy public."items" from 'E:\Bytewise\Task04\items.csv' DELIMITER ',' CSV HEADER;
copy public."customers" from 'E:\Bytewise\Task04\customers.csv' DELIMITER ',' CSV HEADER;
copy public."orders" from 'E:\Bytewise\Task04\orders.csv' DELIMITER ',' CSV HEADER;
copy public."products" from 'E:\Bytewise\Task04\products.csv' DELIMITER ',' CSV HEADER;
copy public."suppliers" from 'E:\Bytewise\Task04\suppliers.csv' DELIMITER ',' CSV HEADER;

-- Query to check if data has been successfully inserted
select* 
from products;

-- If there is need to alter a table
ALTER TABLE cities
ALTER COLUMN country TYPE VARCHAR(100);


-- NOW EXECUTING THE REQUIRED QUERIES
--1
select "name"
from customers
order by "name";

--2
select "name", price
from products
order by price;

--3
select "name"
from suppliers
where "name" like 'A%'
order by "name";

--4
select*
from items
order by status NULLS FIRST;

--5
select*
from products
order by category asc, price desc;

--6
select "name", phone
from customers
order by substring(phone from length(phone)-3 for 4) asc;
