/***************************
 *   Join All The Things   *
 ***************************/

SELECT 
    s.customer_id, 
    order_date, 
    product_name, 
    price, 
    CASE 
        WHEN order_date >= join_date THEN 'Y' 
        ELSE 'N'
    END AS member
FROM dannys_diner.sales AS s
LEFT JOIN dannys_diner.menu AS m ON s.product_id = m.product_id
LEFT JOIN dannys_diner.members AS m2 ON s.customer_id = m2.customer_id;


/***************************
 *   Rank All The Things   *
 ***************************/

WITH is_member AS (
SELECT 
    s.customer_id, 
    order_date, 
    product_name, 
    price, 
    CASE 
        WHEN order_date >= join_date THEN 'Y' 
        ELSE 'N'
    END AS member
FROM dannys_diner.sales AS s
LEFT JOIN dannys_diner.menu AS m ON s.product_id = m.product_id
LEFT JOIN dannys_diner.members AS m2 ON s.customer_id = m2.customer_id
)
SELECT 
    customer_id, 
    order_date, 
    product_name, 
    price,
    CASE 
        WHEN member = 'N' THEN NULL 
        ELSE RANK() OVER(PARTITION BY customer_id, member ORDER BY order_date) 
    END AS ranking
FROM is_member;
