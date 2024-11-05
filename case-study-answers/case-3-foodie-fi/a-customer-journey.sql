/* **************************************************************************************************** *
 *   Based on the 8 sample customers provided in the sample from the subscriptions table,               *
 *   write a brief description about each customer’s onboarding journey.                                *
 *   Try to keep it as short as possible.                                                               *
 *   You may also want to run some sort of join to make your explanations a bit easier!                 *
 * **************************************************************************************************** */

SELECT 
	customer_id,
	plan_id,
	plan_name,
	start_date
FROM foodie_fi.subscriptions
INNER JOIN foodie_fi.plans USING(plan_id)
WHERE customer_id IN (1, 2, 11, 13, 15, 16, 18, 19); 
