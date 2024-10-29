/* ************************************************** * 
 *                                                    *
 *  Case Study #7 - Balanced Tree Clothing Co.        *
 *  REF: https://8weeksqlchallenge.com/case-study-7/  *
 *                                                    *
 * ************************************************** */

BEGIN;

-- Create `balanced_tree` schema
CREATE SCHEMA IF NOT EXISTS balanced_tree;

-- Create `product_hierarchy` table in `balanced_tree` schema
DROP TABLE IF EXISTS balanced_tree.product_hierarchy;
CREATE TABLE IF NOT EXISTS balanced_tree.product_hierarchy (
  id INTEGER,
  parent_id INTEGER,
  level_text VARCHAR(19),
  level_name VARCHAR(8)
);

-- Create `product_prices` table in `balanced_tree` schema
DROP TABLE IF EXISTS balanced_tree.product_prices;
CREATE TABLE IF NOT EXISTS balanced_tree.product_prices (
  id INTEGER,
  product_id VARCHAR(6),
  price INTEGER
);

-- Create `product_details` table in `balanced_tree` schema
DROP TABLE IF EXISTS balanced_tree.product_details;
CREATE TABLE IF NOT EXISTS balanced_tree.product_details (
  product_id VARCHAR(6),
  price INTEGER,
  product_name VARCHAR(32),
  category_id INTEGER,
  segment_id INTEGER,
  style_id INTEGER,
  category_name VARCHAR(6),
  segment_name VARCHAR(6),
  style_name VARCHAR(19)
);

-- Create `sales` table in `balanced_tree` schema
DROP TABLE IF EXISTS balanced_tree.sales;
CREATE TABLE IF NOT EXISTS balanced_tree.sales (
  prod_id VARCHAR(6),
  qty INTEGER,
  price INTEGER,
  discount INTEGER,
  member BOOLEAN,
  txn_id VARCHAR(6),
  start_txn_time TIMESTAMP
);

COMMIT;
