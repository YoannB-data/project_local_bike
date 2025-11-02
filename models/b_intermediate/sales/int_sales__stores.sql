with cte_group_orders_per_store as (
    select
        store_id,
        count(distinct order_id) as count_orders,
        sum(total_quantity) as quantity_sold,
        sum(total_net_revenue) as total_net_revenue
    from {{ ref('int_sales__orders') }}
    group by store_id
),

cte_sellers_per_store as (
    select
        store_id,
        count(staff_id) as count_sellers
    from {{ ref('int_sales__staffs') }}
    group by store_id
),

cte_main as (
    select  
        store_id, 
        store_name, 
        phone, 
        email, 
        street, 
        city, 
        state, 
        zip_code,
        count_sellers,
        count_orders,
        quantity_sold,
        total_net_revenue
    from {{ ref('stg_sales__stores') }}
    left join cte_sellers_per_store
    using(store_id)
    left join cte_group_orders_per_store
    using(store_id)
)

select
    * 
from 
    cte_main