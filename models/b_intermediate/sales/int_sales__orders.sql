with cte_group_order_items_per_order as (
    select
        order_id,
        sum(quantity) as total_quantity,
        sum(list_price) as total_list_price,
        sum(net_revenue) as total_net_revenue
    from {{ ref('int_sales__order_items') }}
    group by order_id
),

cte_main as (
    select
        o.order_id as order_id, 
        customer_id, 
        concat(c.first_name, ' ', c.last_name) as customer_name,
        order_status, 
        order_date, 
        required_date, 
        shipped_date, 
        store_id, 
        store_name,
        staff_id,
        concat(s.first_name, ' ', s.last_name) as staff_name,
        total_quantity,
        total_list_price,
        total_net_revenue
    from {{ ref('stg_sales__orders') }} as o
    left join cte_group_order_items_per_order
    using(order_id)
    left join {{ ref('stg_sales__customers') }} as c
    using(customer_id)
    left join {{ ref('stg_sales__stores') }}
    using(store_id)
    left join {{ ref('stg_sales__staffs') }} as s
    using(staff_id)
)

select 
    *
from
    cte_main