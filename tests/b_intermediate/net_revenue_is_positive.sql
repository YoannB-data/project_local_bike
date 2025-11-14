select
    order_item_id,
    sum(net_revenue) as total_net_revenue
from {{ ref('int_sales__order_items.sql') }}
group by order_item_id
having total_net_revenue < 0