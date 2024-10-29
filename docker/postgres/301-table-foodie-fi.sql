/* ************************************************** * 
 *                                                    *
 *  Case Study #3 - Foodie-Fi                         *
 *  REF: https://8weeksqlchallenge.com/case-study-3/  *
 *                                                    *
 * ************************************************** */

BEGIN;

-- Create `foodie_fi` schema
CREATE SCHEMA IF NOT EXISTS foodie_fi;

-- Create `plans` table in `foodie_fi` schema
DROP TABLE IF EXISTS foodie_fi.plans;
CREATE TABLE IF NOT EXISTS foodie_fi.plans (
  plan_id INTEGER,
  plan_name VARCHAR(13),
  price DECIMAL(5, 2)
);

-- Create `subscriptions` table in `foodie_fi` schema
DROP TABLE IF EXISTS foodie_fi.subscriptions;
CREATE TABLE IF NOT EXISTS foodie_fi.subscriptions (
  customer_id INTEGER,
  plan_id INTEGER,
  start_date DATE
);

COMMIT;
