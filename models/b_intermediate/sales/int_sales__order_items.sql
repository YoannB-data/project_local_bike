select
    oi.order_item_id, 
    oi.order_id, 
    oi.item_id, 
    oi.product_id,
    o.store_id,
    oi.quantity, 
    oi.list_price, 
    oi.discount,
    (oi.quantity * oi.list_price) * (1 - oi.discount) as net_revenue
from {{ ref('stg_sales__order_items') }} as oi
left join {{ ref('stg_sales__orders') }} as o 
    using(order_id)