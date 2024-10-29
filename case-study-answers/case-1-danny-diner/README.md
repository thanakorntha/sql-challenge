
Case Study #1 - Danny's Diner
==================================================

<p align="center">
    <img src = "https://8weeksqlchallenge.com/images/case-study-designs/1.png" alt = "Image by Danny Ma on 8-Week SQL Challenge" width = "50%"  height = "50%">
</p>

Introduction
--------------------------------------------------

Danny is a passionate entrepreneur who opened a Japanese restaurant called Danny's Diner in 2021, selling only his 3 favourite foods such as:

* Sushi  🍣
* Curry  🍛 
* Ramen  🍜

He has been collecting basic data about his customers, such as their visiting patterns, spending habits, and favorite menu items. Danny wants to use this data to **improve his business and make smarter decisions about his customer loyalty program**. 

He has provided a sample of his customer data, and he hopes that you can use it to write SQL queries that will help him answer his questions.


Datasets
--------------------------------------------------

Danny has shared 3 key datasets in the `dannys_diner` database schema:

* **`sales`** = captures all `customer_id` level purchases with an corresponding `order_date` and `product_id` information for when and what menu items were ordered
* **`menu`** = maps the `product_id` to the actual `product_name` and `price` of each menu item
* **`members`** = captures the `join_date` when a `customer_id` joined the beta version of the Danny’s Diner loyalty program
You can see the relationship between 3 tables for this case study below:

```mermaid
---
title: Danny's Diner ERD
---
erDiagram
    members ||--|{ sales : places
    menu    ||--|{ sales : includes

	menu {
		INT product_id PK
		VARCHAR(5) product_name
		INT price
	}
	members {
		VARCHAR(1) customer_id PK
		DATE join_date
	}
	sales {
		VARCHAR(1) customer_id FK
		DATE order_date
		INT product_id
	}
```



Case Study Questions
--------------------------------------------------

Danny has provided me with 10 questions that he needs to be answered:

1. What is the total amount each customer spent at the restaurant?
2. How many days has each customer visited the restaurant?
3. What was the first item from the menu purchased by each customer?
4. What is the most purchased item on the menu and how many times was it purchased by all customers?
5. Which item was the most popular for each customer?
6. Which item was purchased first by the customer after they became a member?
7. Which item was purchased just before the customer became a member?
8. What are the total items and amount spent for each member before they became a member?
9.  If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and customer B have at the end of January?



Bonus Questions
--------------------------------------------------

1. **Join all the things** - Recreate the following table output using the available data:

    | customer_id | order_date | product_name | price | member |
    |-------------|------------|--------------|-------|--------|
    | A           | 2021-01-01 | curry        | 15    | N      |
    | A           | 2021-01-01 | sushi        | 10    | N      |
    | A           | 2021-01-07 | curry        | 15    | Y      |
    | A           | 2021-01-10 | ramen        | 12    | Y      |
    | A           | 2021-01-11 | ramen        | 12    | Y      |
    | A           | 2021-01-11 | ramen        | 12    | Y      |
    | B           | 2021-01-01 | curry        | 15    | N      |
    | B           | 2021-01-02 | curry        | 15    | N      |
    | B           | 2021-01-04 | sushi        | 10    | N      |
    | B           | 2021-01-11 | sushi        | 10    | Y      |
    | B           | 2021-01-16 | ramen        | 12    | Y      |
    | B           | 2021-02-01 | ramen        | 12    | Y      |
    | C           | 2021-01-01 | ramen        | 12    | N      |
    | C           | 2021-01-01 | ramen        | 12    | N      |
    | C           | 2021-01-07 | ramen        | 12    | N      |


2. **Rank all the things** - Danny also requires further information about the `ranking` of customer products, but he purposely does not need the ranking for non-member purchases so he expects null `ranking` values for the records when customers are not yet part of the loyalty program.

    | customer_id | order_date | product_name | price | member | ranking |
    |-------------|------------|--------------|-------|--------|---------|
    | A           | 2021-01-01 | curry        | 15    | N      | null    |
    | A           | 2021-01-01 | sushi        | 10    | N      | null    |
    | A           | 2021-01-07 | curry        | 15    | Y      | 1       |
    | A           | 2021-01-10 | ramen        | 12    | Y      | 2       |
    | A           | 2021-01-11 | ramen        | 12    | Y      | 3       |
    | A           | 2021-01-11 | ramen        | 12    | Y      | 3       |
    | B           | 2021-01-01 | curry        | 15    | N      | null    |
    | B           | 2021-01-02 | curry        | 15    | N      | null    |
    | B           | 2021-01-04 | sushi        | 10    | N      | null    |
    | B           | 2021-01-11 | sushi        | 10    | Y      | 1       |
    | B           | 2021-01-16 | ramen        | 12    | Y      | 2       |
    | B           | 2021-02-01 | ramen        | 12    | Y      | 3       |
    | C           | 2021-01-01 | ramen        | 12    | N      | null    |
    | C           | 2021-01-01 | ramen        | 12    | N      | null    |
    | C           | 2021-01-07 | ramen        | 12    | N      | null    |