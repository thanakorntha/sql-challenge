/* **************************************************************************************************** *
 *   1. How many customers has Foodie-Fi ever had?                                                      *
 * **************************************************************************************************** */

SELECT COUNT(DISTINCT customer_id) AS unique_customer_count
FROM foodie_fi.subscriptions;

 /* **************************************************************************************************** *
  *   2. What is the monthly distribution of `trial` plan `start_date` values for our dataset?           *
  *      Use the start of the month as the group by value.                                               *
  * **************************************************************************************************** */

SELECT 
	EXTRACT(month FROM start_date) AS month_number,
	TO_CHAR(start_date, 'Month') AS month_name,
	COUNT(customer_id) AS trial_count
FROM foodie_fi.subscriptions
WHERE plan_id = 0
GROUP BY 
	month_number, 
	month_name
ORDER BY month_number;

 /* **************************************************************************************************** *
  *   3. What plan do `start_date` values occur after the year 2020 for our dataset?                     *
  *      Show the breakdown by count of events for each `plan_name`.                                     *
  * **************************************************************************************************** */

SELECT 
	plan_id, 
	plan_name, 
	COUNT(plan_id) AS event_count
FROM foodie_fi.subscriptions
INNER JOIN foodie_fi.plans USING(plan_id)
WHERE start_date >= '2021-01-01'
GROUP BY 
	plan_id, 
	plan_name
ORDER BY plan_id;

 /* **************************************************************************************************** *
  *   4. What is the customer count and percentage of customers who have churned                         *
  *      rounded to 1 decimal place?                                                                     *
  * **************************************************************************************************** */

SELECT 
	plan_id, 
	plan_name,
	COUNT(DISTINCT customer_id) AS customer_count,
	ROUND( (COUNT(DISTINCT customer_id) * 100.0 ) / (
		SELECT COUNT(DISTINCT customer_id)
		FROM foodie_fi.subscriptions
	), 1) AS customer_percent
FROM foodie_fi.subscriptions
INNER JOIN foodie_fi.plans USING(plan_id)
WHERE plan_id = 4
GROUP BY 
	plan_id, 
	plan_name
ORDER BY plan_id;

 /* **************************************************************************************************** *
  *   5. How many customers have churned straight after their initial free trial?                        *
  *      What percentage is this rounded to the nearest whole number?                                    *
  * **************************************************************************************************** */

WITH customer_plan_journey AS (
	SELECT 
		customer_id,
		plan_id,
		plan_name,
		start_date,
		ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY start_date) AS plan_selection
	FROM foodie_fi.subscriptions
	INNER JOIN foodie_fi.plans USING(plan_id)
)
SELECT 
	COUNT(customer_id) AS churn_count_after_trial,
	ROUND( (COUNT(DISTINCT customer_id) * 100.0 ) / (
		SELECT COUNT(DISTINCT customer_id)
		FROM foodie_fi.subscriptions
	), 0) AS churn_percent_after_trial
FROM customer_plan_journey
WHERE plan_id = 4 AND plan_selection = 2;

 /* **************************************************************************************************** *
  *   6. What is the number and percentage of customer plans after their initial free trial?             *
  * **************************************************************************************************** */

WITH customer_plan_journey AS (
	SELECT 
		customer_id,
		plan_id,
		LEAD(plan_id) OVER (PARTITION BY customer_id ORDER BY start_date) AS next_plan
	FROM foodie_fi.subscriptions
)
SELECT 
	customer_plan_journey.next_plan AS plan_id, 
	p2.plan_name,
	COUNT(DISTINCT customer_plan_journey.customer_id) AS customer_count_after_trial,
	ROUND( (COUNT(DISTINCT customer_plan_journey.customer_id) * 100.0 ) / (
		SELECT COUNT(DISTINCT customer_id)
		FROM foodie_fi.subscriptions
	), 2) AS customer_percent_after_trial
FROM customer_plan_journey
INNER JOIN foodie_fi.plans AS p1 ON customer_plan_journey.plan_id = p1.plan_id
INNER JOIN foodie_fi.plans AS p2 ON customer_plan_journey.next_plan = p2.plan_id
WHERE customer_plan_journey.plan_id = 0
GROUP BY 1, 2;

 /* **************************************************************************************************** *
  *   7. What is the customer count and percentage breakdown of all 5 `plan_name` values                 * 
  *      at `2020-12-31`?                                                                                *                                                                              *
  * **************************************************************************************************** */

WITH customer_plan_journey AS (
	SELECT 
		customer_id,
		plan_id, 
		start_date AS current_plan,
		LEAD(start_date) OVER (PARTITION BY customer_id ORDER BY start_date) AS next_plan	
	FROM foodie_fi.subscriptions
	WHERE TO_CHAR(start_date, 'YYYY') = '2020'
)
SELECT 
	plan_id, 
	plan_name, 
	COUNT(DISTINCT customer_id) AS customer_count,
	ROUND( (COUNT(DISTINCT customer_id) * 100.0 ) / (
		SELECT COUNT(DISTINCT customer_id)
		FROM foodie_fi.subscriptions
	), 2) AS customer_percent
FROM customer_plan_journey
INNER JOIN foodie_fi.plans USING(plan_id)
WHERE next_plan IS NULL
GROUP BY plan_id, plan_name;

 /* **************************************************************************************************** *
  *   8. How many customers have upgraded to an annual plan in 2020?                                     *
  * **************************************************************************************************** */

SELECT COUNT(DISTINCT customer_id) AS annual_upgrade_count
FROM foodie_fi.subscriptions
WHERE TO_CHAR(start_date, 'YYYY') = '2020' AND plan_id = 3;

 /* **************************************************************************************************** *
  *   9. How many days on average does it take for a customer to an annual plan                          * 
  *      from the day they join Foodie-Fi?                                                               *
  * **************************************************************************************************** */

WITH first_join_date AS (
	SELECT 
		customer_id, 
		MIN(start_date) AS start_date
	FROM foodie_fi.subscriptions
	GROUP BY customer_id
	ORDER BY customer_id
), first_join_plan AS (
	SELECT 
		customer_id,
		plan_id,
		plan_name AS start_plan_name, 
		start_date AS start_join_date
	FROM foodie_fi.subscriptions
	INNER JOIN first_join_date USING(customer_id, start_date)
	INNER JOIN foodie_fi.plans USING(plan_id)
	ORDER BY customer_id
), upgrade_pro_plan AS (
	SELECT 
		customer_id,
		plan_id, 
		plan_name AS pro_plan_name, 
		start_date AS start_pro_date
	FROM foodie_fi.subscriptions
	INNER JOIN foodie_fi.plans USING(plan_id)
	WHERE plan_id = 3
)
SELECT ROUND(AVG(start_pro_date - start_join_date), 2) AS avg_day_upgrade
FROM first_join_plan
INNER JOIN upgrade_pro_plan USING(customer_id);

 /* **************************************************************************************************** *
  *   10. Can you further breakdown this average value into 30 day periods?                              *
  *       (i.e. 0-30 days, 31-60 days etc)                                                               *
  * **************************************************************************************************** */

WITH first_join_date AS (
	SELECT 
		customer_id, 
		MIN(start_date) AS start_date
	FROM foodie_fi.subscriptions
	GROUP BY customer_id
	ORDER BY customer_id
), first_join_plan AS (
	SELECT 
		customer_id,
		plan_id,
		plan_name AS start_plan_name, 
		start_date AS start_join_date
	FROM foodie_fi.subscriptions
	INNER JOIN first_join_date USING(customer_id, start_date)
	INNER JOIN foodie_fi.plans USING(plan_id)
	ORDER BY customer_id
), upgrade_pro_plan AS (
	SELECT 
		customer_id,
		plan_id, 
		plan_name AS pro_plan_name, 
		start_date AS start_pro_date
	FROM foodie_fi.subscriptions
	INNER JOIN foodie_fi.plans USING(plan_id)
	WHERE plan_id = 3
), period_breakdown AS (
	SELECT 
		customer_id, 
		WIDTH_BUCKET(start_pro_date - start_join_date, 0, 365, 12) AS bucket,
		start_pro_date - start_join_date AS avg_day_upgrade
	FROM first_join_plan
	INNER JOIN upgrade_pro_plan USING(customer_id)
	ORDER BY customer_id
)
SELECT 
	bucket,
	(bucket - 1) * 30 || ' - ' || bucket * 30 || ' days' AS day_period, 
	COUNT(avg_day_upgrade) AS customer_count
FROM period_breakdown
GROUP BY bucket
ORDER BY bucket;

 /* **************************************************************************************************** *
  *   11. How many customers downgraded from a pro monthly to a basic monthly plan in 2020?              *
  * **************************************************************************************************** */

WITH customer_plan_journey AS (
	SELECT 
		customer_id,
		start_date, 
		plan_id AS current_plan,
		LEAD(plan_id) OVER (PARTITION BY customer_id ORDER BY start_date) AS next_plan
	FROM foodie_fi.subscriptions
	INNER JOIN foodie_fi.plans USING(plan_id)
)
SELECT COUNT(customer_id) AS customer_count
FROM customer_plan_journey
WHERE 
	TO_CHAR(start_date, 'YYYY') = '2020' AND
	current_plan = 2 AND 
	next_plan = 1;
