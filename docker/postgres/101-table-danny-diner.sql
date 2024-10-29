/* ************************************************** * 
 *                                                    *
 *  Case Study #1 - Danny's Diner                     *
 *  REF: https://8weeksqlchallenge.com/case-study-1/  *
 *                                                    *
 * ************************************************** */

BEGIN;

-- Create `dannys_diner` schema
CREATE SCHEMA IF NOT EXISTS dannys_diner;

-- Create `sales` tables in `dannys_diner` schema
DROP TABLE IF EXISTS dannys_diner.sales;
CREATE TABLE IF NOT EXISTS dannys_diner.sales (
  customer_id VARCHAR(1),
  order_date DATE,
  product_id INTEGER
);

-- Create `members` tables in `dannys_diner` schema
DROP TABLE IF EXISTS dannys_diner.menu;
CREATE TABLE IF NOT EXISTS dannys_diner.menu (
  product_id INTEGER,
  product_name VARCHAR(5),
  price INTEGER
);

-- Create `members` tables in `dannys_diner` schema
DROP TABLE IF EXISTS dannys_diner.members;
CREATE TABLE IF NOT EXISTS dannys_diner.members (
  customer_id VARCHAR(1),
  join_date DATE
);

COMMIT;
