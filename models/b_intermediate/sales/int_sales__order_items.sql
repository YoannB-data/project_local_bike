with cte_main as (
    select
        order_item_id, 
        order_id, 
        item_id, 
        product_id,
        quantity, 
        list_price, 
        discount,
        round((quantity * list_price) * (1 - discount),2) as net_revenue
    from {{ ref('stg_sales__order_items') }}
)

select
    * 
from
    cte_main    