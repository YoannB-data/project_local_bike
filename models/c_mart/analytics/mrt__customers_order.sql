select customer_id,
    store_city,
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date,
    COUNT(order_id) as total_orders,
    SUM(total_net_revenue) as total_order_amount,
    AVG(total_net_revenue) as avg_order_amount,
    DATE_DIFF(DATE(MAX(order_date)), DATE(MIN(order_date)), DAY) / 365.0 as customer_lifespan
from {{ ref('int_sales__orders') }}
group by customer_id,
    store_city
order by customer_id,
    store_city