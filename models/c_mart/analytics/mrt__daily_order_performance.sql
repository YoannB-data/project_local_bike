/*{{ config(
    partition_by= {
      "field": "order_date",
      "data_type": "date"
    }
)}}*/

select order_date,
    store_city,
    COUNT(order_id) as total_orders,
    SUM(total_quantity) as total_quantity,
    SUM(total_net_revenue) as total_order_amount,
    AVG(total_net_revenue) as avg_order_amount
from {{ ref('int_sales__orders') }}
group by order_date,
    store_city