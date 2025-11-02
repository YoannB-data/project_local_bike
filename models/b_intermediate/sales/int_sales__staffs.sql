with cte_group_orders_per_staff as (
    select
        staff_id,
        sum(total_quantity) as quantity_sold,
        sum(total_net_revenue) as total_sales
    from {{ ref('int_sales__orders') }}
    group by staff_id
),

cte_manager_name as (
    select
        s.staff_id,
        m.first_name as manager_first_name,
        m.last_name as manager_last_name,
        concat(m.first_name, ' ', m.last_name) as manager_name,
    from {{ ref('stg_sales__staffs') }} as s
    left join {{ ref('stg_sales__staffs') }} as m
    on s.manager_id = m.staff_id
),

cte_main as (
    select
        staff_id, 
        first_name, 
        last_name, 
        concat(first_name, ' ', last_name) as staff_name,
        email, 
        phone, 
        active, 
        store_id, 
        store_name,
        manager_id,
        manager_first_name,
        manager_last_name,
        manager_name,
        quantity_sold,
        total_sales
    from {{ ref('stg_sales__staffs') }}
    left join cte_manager_name
    using(staff_id)
    left join cte_group_orders_per_staff
    using(staff_id)
    left join {{ ref('stg_sales__stores') }}
    using(store_id)
)

select  
    *
from
    cte_main