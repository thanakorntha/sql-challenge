/* **************************************************************************************************** *
 *  CUSTOMER_ORDERS TABLE                                                                               *
 * **************************************************************************************************** */

-- Query Check
SELECT * FROM pizza_runner.customer_orders;

-- Data Type Check
SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME='customer_orders';

-- New Updated Query 
SELECT 
	order_id, 
	customer_id, 
	pizza_id, 
	CASE 
		WHEN exclusions IN ('', 'null') THEN NULL
		ELSE exclusions
	END AS exclusions,
	CASE 
		WHEN extras IN ('', 'null', 'Nan') THEN NULL
		ELSE extras
	END AS extras,
	order_time
FROM pizza_runner.customer_orders;

-- New Update
UPDATE pizza_runner.customer_orders
SET exclusions = CASE 
		WHEN exclusions IN ('', 'null') THEN NULL
		ELSE exclusions
	END, 
	extras = CASE 
		WHEN extras IN ('', 'null', 'Nan') THEN NULL
		ELSE extras
	END;


/* **************************************************************************************************** *
 *  RUNNER_ORDERS TABLE                                                                                 *
 * **************************************************************************************************** */

-- Query Check
SELECT * FROM pizza_runner.runner_orders;

-- Data Type Check
SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME='runner_orders';

-- New Updated Query 
SELECT
	order_id, 
	runner_id, 
	NULLIF(pickup_time, 'null') AS pickup_time, 
	CAST(
		CASE 
			WHEN distance IN ('', 'null') THEN NULL
			WHEN distance LIKE '%km%' THEN TRIM('km' FROM distance)
			ELSE distance
		END 
	AS FLOAT) AS distance,
	CAST(
		CASE 
			WHEN duration IN ('', 'null') THEN NULL
			WHEN duration ~ '.+[A-z]+$' THEN TRIM(REGEXP_REPLACE(duration, '[A-Za-z\s]+$', ''))
			ELSE duration
		END
	AS INTEGER) AS duration,
	CASE 
		WHEN cancellation IN ('', 'null') THEN NULL
		ELSE cancellation
	END AS cancellation
FROM pizza_runner.runner_orders;

-- New Update
UPDATE pizza_runner.runner_orders
SET pickup_time = NULLIF(pickup_time, 'null'), 
	distance = CAST(
		CASE 
			WHEN distance IN ('', 'null') THEN NULL
			WHEN distance LIKE '%km%' THEN TRIM('km' FROM distance)
			ELSE distance
		END 
	AS FLOAT),
	duration = CAST(
		CASE 
			WHEN duration IN ('', 'null') THEN NULL
			WHEN duration ~ '.+[A-z]+$' THEN TRIM(REGEXP_REPLACE(duration, '[A-Za-z\s]+$', ''))
			ELSE duration
		END
	AS INTEGER),
	cancellation = CASE 
		WHEN cancellation IN ('', 'null') THEN NULL
		ELSE cancellation
	END;
