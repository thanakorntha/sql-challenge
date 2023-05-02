/************************************************************************** 
 *   1. What is the total amount each customer spent at the restaurant?   *
 **************************************************************************/

SELECT 
    customer_id, 
    SUM(price) AS total_price
FROM sales AS s
INNER JOIN menu AS m ON s.product_id = m.product_id
GROUP BY customer_id;


/******************************************************************
 *   2. How many days has each customer visited the restaurant?   *
 ******************************************************************/

SELECT 
    customer_id, 
    COUNT(DISTINCT(order_date)) AS visit_count
FROM sales
GROUP BY customer_id;


/****************************************************************************
 *   3. What was the first item from the menu purchased by each customer?   *
 ****************************************************************************/

WITH item_purchase_rank AS (
    SELECT 
        customer_id,
        order_date, 
        product_name, 
        RANK() OVER (PARTITION BY customer_id ORDER BY order_date) AS item_rank
    FROM sales AS s
    INNER JOIN menu AS m ON s.product_id = m.product_id
)
SELECT 
    customer_id, 
    product_name
FROM item_purchase_rank
WHERE item_rank = 1
GROUP BY 
    customer_id, 
    product_name;


/************************************************************************************************************
 *   4. What is the most purchased item on the menu and how many times was it purchased by all customers?   *
 ************************************************************************************************************/

SELECT 
    product_name, 
    COUNT(product_name) AS item_count
FROM sales AS s
JOIN menu AS m ON s.product_id = m.product_id
GROUP BY product_name
ORDER BY item_count DESC
LIMIT 1;


/*************************************************************
 *   5. Which item was the most popular for each customer?   *
 *************************************************************/

WITH popular_item_rank AS (
    SELECT 
        customer_id,
        product_name, 
        COUNT(product_name) AS item_count,
        RANK() OVER (PARTITION BY customer_id ORDER BY COUNT(customer_id) DESC) AS item_rank
    FROM sales AS s
    INNER JOIN menu AS m ON s.product_id = m.product_id
    GROUP BY 
        customer_id, 
        product_name
)
SELECT 
    customer_id, 
    product_name,
    item_count
FROM popular_item_rank
WHERE item_rank = 1;


/*************************************************************************************
 *   6. Which item was purchased first by the customer after they became a member?   *
 *************************************************************************************/

WITH member_purchase_after AS (
    SELECT 
        s.customer_id,
        join_date,
        order_date,
        product_id,
        RANK() OVER (PARTITION BY s.customer_id ORDER BY order_date) AS item_rank
    FROM sales AS s
    INNER JOIN members AS m ON s.customer_id = m.customer_id
    WHERE order_date >= join_date
)
SELECT 
    customer_id, 
    order_date, 
    product_name
FROM member_purchase_after AS mpa
INNER JOIN menu AS m2 ON mpa.product_id = m2.product_id
WHERE item_rank = 1
ORDER BY customer_id;


/*****************************************************************************
 *   7. Which item was purchased just before the customer became a member?   *
 *****************************************************************************/

WITH member_purchase_before AS (
    SELECT 
        s.customer_id,
        join_date,
        order_date,
        product_id,
        RANK() OVER (PARTITION BY s.customer_id ORDER BY order_date DESC) AS item_rank
    FROM sales AS s
    INNER JOIN members AS m ON s.customer_id = m.customer_id
    WHERE order_date < join_date
)
SELECT 
    customer_id, 
    order_date, 
    product_name
FROM member_purchase_before AS mpb
INNER JOIN menu AS m2 ON mpb.product_id = m2.product_id
WHERE item_rank = 1
ORDER BY customer_id;


/************************************************************************************************
 *   8. What is the total items and amount spent for each member before they became a member?   *
 ************************************************************************************************/

SELECT 
    s.customer_id, 
    COUNT(DISTINCT(product_name)) AS total_item,
    SUM(price) AS total_price
FROM sales AS s
INNER JOIN menu AS m ON s.product_id = m.product_id
INNER JOIN members AS m2 ON s.customer_id = m2.customer_id
WHERE order_date < join_date
GROUP BY s.customer_id
ORDER BY s.customer_id;


/**********************************************************************************************************************************
 *   9.  If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?   *
 **********************************************************************************************************************************/

WITH menu_point AS (
    SELECT 
        product_id, 
        product_name, 
        price,
        CASE 
            WHEN product_id = 1 THEN (price * 10) * 2 
            ELSE price * 10 
        END AS menu_point
    FROM menu
)
SELECT 
    s.customer_id,
    SUM(menu_point) AS total_point
FROM sales AS s
INNER JOIN menu_point AS mp ON s.product_id = mp.product_id
GROUP BY s.customer_id
ORDER BY s.customer_id;


/***************************************************************************************************************************************************************************************************************
 *   10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - How many points do customer A and B have at the end of January?   *
 ***************************************************************************************************************************************************************************************************************/

WITH is_member AS (
    SELECT 
        s.customer_id,
        join_date,
        order_date,
        s.product_id, 
        product_name, 
        price, 
        CASE 
            WHEN (join_date <= order_date) AND ((join_date + INTERVAL 6 DAY) >= order_date) THEN 'Y'
            ELSE 'N'
        END AS is_member
    FROM sales AS s
    INNER JOIN menu AS m ON s.product_id = m.product_id
    INNER JOIN members AS m2 ON s.customer_id = m2.customer_id
    ORDER BY s.customer_id, order_date
)
SELECT
    customer_id,
    SUM(
        CASE 
            WHEN is_member = 'Y' THEN (price * 10) * 2
            WHEN is_member = 'N' AND product_id = 1 THEN (price * 10) * 2
            ELSE price * 10
        END
    ) AS total_point
FROM is_member
WHERE order_date <= '2021-01-31'
GROUP BY customer_id
ORDER BY customer_id;