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
FROM sales AS s
LEFT JOIN menu AS m ON s.product_id = m.product_id
LEFT JOIN members AS m2 ON s.customer_id = m2.customer_id;


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
FROM sales AS s
LEFT JOIN menu AS m ON s.product_id = m.product_id
LEFT JOIN members AS m2 ON s.customer_id = m2.customer_id
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