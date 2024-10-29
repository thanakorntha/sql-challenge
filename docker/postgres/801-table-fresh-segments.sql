/* ************************************************** * 
 *                                                    *
 *  Case Study #8 - Fresh Segments                    *
 *  REF: https://8weeksqlchallenge.com/case-study-8/  *
 *                                                    *
 * ************************************************** */

BEGIN;

-- Create `fresh_segments` schema
CREATE SCHEMA IF NOT EXISTS fresh_segments;

-- Create `interest_map` table in `fresh_segments` schema
DROP TABLE IF EXISTS fresh_segments.interest_map;
CREATE TABLE IF NOT EXISTS fresh_segments.interest_map (
  id INTEGER,
  interest_name TEXT,
  interest_summary TEXT,
  created_at TIMESTAMP,
  last_modified TIMESTAMP
);

-- Create `interest_metrics` table in `fresh_segments` schema
DROP TABLE IF EXISTS fresh_segments.interest_metrics;
CREATE TABLE fresh_segments.interest_metrics (
  _month VARCHAR(4),
  _year VARCHAR(4),
  month_year VARCHAR(7),
  interest_id VARCHAR(5),
  composition FLOAT,
  index_value FLOAT,
  ranking INTEGER,
  percentile_ranking FLOAT
);

-- Create `json_data` table in `fresh_segments` schema
DROP TABLE IF EXISTS fresh_segments.json_data;
CREATE TABLE IF NOT EXISTS fresh_segments.json_data (
  raw_data JSON
);

COMMIT;
