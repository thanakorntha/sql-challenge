PostgreSQL Database
==================================================

This directory contains SQL scripts for initializing Danny's database (`danny_db`) when running Docker Compose. These scripts are organized by case study. Each case study has two files:

- `X01-table-<case-study-name>.sql`: Creates the schemas and tables for the case study within the `danny_db` database.
- `X02-data-<case-study-name>.sql`: Populates the sample data relevant to the case study.

`X` represents the case study number. After running Docker Compose, you can access pgAdmin at http://localhost:8080/ to view the database schemas, tables, and sample data.


Danny's Database
--------------------------------------------------

Danny, the owner of the `danny_db` database, has provided eight database schemas for this challenge.

1. **Danny's Diner:** There are 3 tables in the `dannys_diner` schema: 
    - `sales`
    - `menu`
    - `members`
2. **Pizza Runner:** There are 6 tables in the `pizza_runner` schema: 
    - `runners`
    - `customer_orders`
    - `runner_orders`
    - `pizza_names`
    - `pizza_recipes`
    - `pizza_toppings`
3. **Foodie-Fi:** There are 2 tables in the `foodie_fi` schema: 
    - `plans`
    - `subscriptions`
4. **Data Bank:** There are 3 tables in the `data_bank` schema: 
    - `regions`
    - `customer_nodes`
    - `customer_transactions`
5. **Data Mart:** There is only 1 table in the `data_mart` schema: 
    - `weekly_sales`
6. **Clique Bait:** There are 5 tables in the `clique_bait` schema: 
    - `event_identifier`
    - `campaign_identifier`
    - `page_hierarchy`
    - `users`
    - `events`
7. **Balanced Tree Clothing Co.:** There are 4 tables in the `balanced_tree` schema: 
    - `product_hierarchy`
    - `product_prices`
    - `product_details`
    - `sales`
8. **Fresh Segments:** There are 3 tables in the `fresh_segments` schema: 
    - `interest_map`
    - `interest_metrics`
    - `json_data`
 
For more information on the 8-Week SQL Challenge, please visit [here](https://8weeksqlchallenge.com/)