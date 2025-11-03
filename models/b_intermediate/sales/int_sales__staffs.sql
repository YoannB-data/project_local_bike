with cte_manager_name as (
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
        s.email as email, 
        s.phone as phone, 
        active, 
        store_id,
        manager_id,
        manager_first_name,
        manager_last_name,
        manager_name
    from {{ ref('stg_sales__staffs') }} as s
    left join cte_manager_name
    using(staff_id)
)

select  
    *
from
    cte_main