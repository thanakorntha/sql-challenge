/* ************************************************** * 
 *                                                    *
 *  Case Study #6 - Clique Bait                       *
 *  REF: https://8weeksqlchallenge.com/case-study-6/  *
 *                                                    *
 * ************************************************** */

BEGIN;

-- Create `clique_bait` schema
CREATE SCHEMA IF NOT EXISTS clique_bait;

-- Create `event_identifier` table in `clique_bait` schema
DROP TABLE IF EXISTS clique_bait.event_identifier;
CREATE TABLE IF NOT EXISTS clique_bait.event_identifier (
  event_type INTEGER,
  event_name VARCHAR(13)
);

-- Create `campaign_identifier` table in `clique_bait` schema
DROP TABLE IF EXISTS clique_bait.campaign_identifier;
CREATE TABLE IF NOT EXISTS clique_bait.campaign_identifier (
  campaign_id INTEGER,
  products VARCHAR(3),
  campaign_name VARCHAR(33),
  start_date TIMESTAMP,
  end_date TIMESTAMP
);

-- Create `page_hierarchy` table in `clique_bait` schema
DROP TABLE IF EXISTS clique_bait.page_hierarchy;
CREATE TABLE IF NOT EXISTS clique_bait.page_hierarchy (
  page_id INTEGER,
  page_name VARCHAR(14),
  product_category VARCHAR(9),
  product_id INTEGER
);

-- Create `users` table in `clique_bait` schema
DROP TABLE IF EXISTS clique_bait.users;
CREATE TABLE IF NOT EXISTS clique_bait.users (
  user_id INTEGER,
  cookie_id VARCHAR(6),
  start_date TIMESTAMP
);

-- Create `events` table in `clique_bait` schema
DROP TABLE IF  EXISTS clique_bait.events;
CREATE TABLE IF NOT EXISTS clique_bait.events (
  visit_id VARCHAR(6),
  cookie_id VARCHAR(6),
  page_id INTEGER,
  event_type INTEGER,
  sequence_number INTEGER,
  event_time TIMESTAMP
);

COMMIT;
