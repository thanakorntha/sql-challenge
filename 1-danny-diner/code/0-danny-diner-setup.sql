/********************** 
 *   SETUP DATABASE   *
 **********************/

-- Create the "dannys_diner" database
CREATE SCHEMA IF NOT EXISTS dannys_diner;

-- Set the "dannys_diner" database as an active database
USE dannys_diner;


/***************************** 
 *   CREATE TABLE 1: SALES   *
 *****************************/

-- Create the "sales" table, consisting of 3 columns: customer_id, order_date, and product_id
CREATE TABLE IF NOT EXISTS sales (
    customer_id VARCHAR(1), 
    order_date DATE, 
    product_id INTEGER
);

-- Insert 15 records in the "sales" table
INSERT INTO sales
	(customer_id, order_date, product_id)
VALUES
	('A', '2021-01-01', '1'),
    ('A', '2021-01-01', '2'),
    ('A', '2021-01-07', '2'),
    ('A', '2021-01-10', '3'),
    ('A', '2021-01-11', '3'),
    ('A', '2021-01-11', '3'),
    ('B', '2021-01-01', '2'),
    ('B', '2021-01-02', '2'),
    ('B', '2021-01-04', '1'),
    ('B', '2021-01-11', '1'),
    ('B', '2021-01-16', '3'),
    ('B', '2021-02-01', '3'),
    ('C', '2021-01-01', '3'),
    ('C', '2021-01-01', '3'),
    ('C', '2021-01-07', '3');
 

/**************************** 
 *   CREATE TABLE 2: MENU   *
 ****************************/

-- Create the "menu" table, consisting of 3 columns: product_id, product_name, and price
CREATE TABLE IF NOT EXISTS menu (
	product_id INTEGER,
    product_name VARCHAR(5),
    price INTEGER
);

-- Insert 3 records in the "menu" table
INSERT INTO menu
	(product_id, product_name, price)
VALUES
	('1', 'sushi', '10'),
    ('2', 'curry', '15'),
    ('3', 'ramen', '12');


/******************************* 
 *   CREATE TABLE 3: MEMBERS   *
 *******************************/

-- Create the "members" table, consisting of 2 columns: customer_id and join_date
CREATE TABLE IF NOT EXISTS members (
	customer_id VARCHAR(1),
    join_date DATE
);

-- Insert 2 records in the "members" table
INSERT INTO members
	(customer_id, join_date)
VALUES
	('A', '2021-01-07'),
    ('B', '2021-01-09');