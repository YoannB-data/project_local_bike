with cte_main as (
    select
        order_item_id, 
        order_id, 
        item_id, 
        product_id,
        product_name,
        customer_id,
        order_status, 
        quantity, 
        oi.list_price as list_price, 
        discount,
        round((quantity * oi.list_price) * (1 - discount),2) as net_revenue
    from {{ ref('stg_sales__order_items') }} oi
    left join {{ ref('stg_production__products') }}
    using(product_id)
    left join {{ ref('stg_sales__orders') }}
    using(order_id)
)

select
    * 
from
    cte_main    