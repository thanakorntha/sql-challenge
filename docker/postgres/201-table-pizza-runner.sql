/* ************************************************** * 
 *                                                    *
 *  Case Study #2 - Pizza Runner                      *
 *  REF: https://8weeksqlchallenge.com/case-study-2/  *
 *                                                    *
 * ************************************************** */

BEGIN;

-- Create `pizza_runner` schema
CREATE SCHEMA IF NOT EXISTS pizza_runner;

-- Create `runners` tables in `pizza_runner` schema
DROP TABLE IF EXISTS pizza_runner.runners;
CREATE TABLE IF NOT EXISTS pizza_runner.runners (
  runner_id INTEGER,
  registration_date DATE
);

-- Create `customer_orders` tables in `pizza_runner` schema
DROP TABLE IF EXISTS pizza_runner.customer_orders;
CREATE TABLE IF NOT EXISTS pizza_runner.customer_orders (
  order_id INTEGER,
  customer_id INTEGER,
  pizza_id INTEGER,
  exclusions VARCHAR(4),
  extras VARCHAR(4),
  order_time TIMESTAMP
);

-- Create `runner_orders` tables in `pizza_runner` schema
DROP TABLE IF EXISTS pizza_runner.runner_orders;
CREATE TABLE IF NOT EXISTS pizza_runner.runner_orders (
  order_id INTEGER,
  runner_id INTEGER,
  pickup_time VARCHAR(19),
  distance VARCHAR(7),
  duration VARCHAR(10),
  cancellation VARCHAR(23)
);

-- Create `pizza_names` tables in `pizza_runner` schema
DROP TABLE IF EXISTS pizza_runner.pizza_names;
CREATE TABLE IF NOT EXISTS pizza_runner.pizza_names (
  pizza_id INTEGER,
  pizza_name TEXT
);

-- Create `pizza_recipes` tables in `pizza_runner` schema
DROP TABLE IF EXISTS pizza_runner.pizza_recipes;
CREATE TABLE IF NOT EXISTS pizza_runner.pizza_recipes (
  pizza_id INTEGER,
  toppings TEXT
);

-- Create `pizza_toppings` tables in `pizza_runner` schema
DROP TABLE IF EXISTS pizza_runner.pizza_toppings;
CREATE TABLE IF NOT EXISTS pizza_runner.pizza_toppings (
  topping_id INTEGER,
  topping_name TEXT
);

COMMIT;
