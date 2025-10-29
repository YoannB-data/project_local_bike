with cte_main as(
    select
        c.category_id as category_id, 
        c.category_name as category_name,
        sum(quantity_stock) as quantity_stock,
        sum(quantity_sold) as quantity_sold,
        round(sum(total_item_amount),2) as total_item_amount
    from 
        {{ ref('stg_production__categories') }} as c
    left join
        {{ ref('int_production__products') }} as p
    using(category_id)
    group by
        category_id,
        category_name
)

select 
    *
from
    cte_main