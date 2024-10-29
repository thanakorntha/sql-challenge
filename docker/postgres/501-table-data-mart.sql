/* ************************************************** * 
 *                                                    *
 *  Case Study #5 - Data Mart                         *
 *  REF: https://8weeksqlchallenge.com/case-study-5/  *
 *                                                    *
 * ************************************************** */

BEGIN;

-- Create `data_mart` schema
CREATE SCHEMA IF NOT EXISTS data_mart;

-- Create `weekly_sales` table in `data_mart` schema
DROP TABLE IF EXISTS data_mart.weekly_sales;
CREATE TABLE IF NOT EXISTS data_mart.weekly_sales (
  week_date VARCHAR(7),
  region VARCHAR(13),
  platform VARCHAR(7),
  segment VARCHAR(4),
  customer_type VARCHAR(8),
  transactions INTEGER,
  sales INTEGER
);

COMMIT;
