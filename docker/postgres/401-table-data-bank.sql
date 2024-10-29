/* ************************************************** * 
 *                                                    *
 *  Case Study #4 - Data Bank                         *
 *  REF: https://8weeksqlchallenge.com/case-study-4/  *
 *                                                    *
 * ************************************************** */

BEGIN;

-- Create `data_bank` schema
CREATE SCHEMA IF NOT EXISTS data_bank;

-- Create `regions` table in `data_bank` schema
DROP TABLE IF EXISTS data_bank.regions;
CREATE TABLE IF NOT EXISTS data_bank.regions (
  region_id INTEGER,
  region_name VARCHAR(9)
);

-- Create `customer_nodes` table in `data_bank` schema
DROP TABLE IF EXISTS data_bank.customer_nodes;
CREATE TABLE IF NOT EXISTS data_bank.customer_nodes (
  customer_id INTEGER,
  region_id INTEGER,
  node_id INTEGER,
  start_date DATE,
  end_date DATE
);

-- Create `customer_transactions` table in `data_bank` schema
DROP TABLE IF EXISTS data_bank.customer_transactions;
CREATE TABLE IF NOT EXISTS data_bank.customer_transactions (
  customer_id INTEGER,
  txn_date DATE,
  txn_type VARCHAR(10),
  txn_amount INTEGER
);

COMMIT;
